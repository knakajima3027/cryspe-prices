<template>
  <div>
    <v-card>
      <v-card-text>
        <v-form>
          <v-container>
            <v-row class="blue lighten-4" justify="center" align-content="center">
            <v-col cols="12" md="4">
              <v-text-field v-model="name" prepend-icon="address-card" label="カード名" />
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="price" prepend-icon="usd-circle" label="値段" />
            </v-col>
            </v-row>
          </v-container>
          <v-card-actions>
            <v-btn color="orange" @click="search()">検索</v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>

    
  <v-container>
    <v-row class="blue lighten-4" style="height: 450px;" justify="center" align-content="center">
    <v-col cols="6" xs="12" sm="6" md="2" lg="2" v-for="card in cards" v-bind:key="card.img">
      <v-card class="mx-auto" max-width="344px">  
        <v-img :src="card.img" height="300px"></v-img>
        <v-card-title>
          {{ card["name"] }}
        </v-card-title>
        <v-card-subtitle> 
          {{ card["price"] }} 円
        </v-card-subtitle>
      <v-card-actions>
        <v-btn :href=card.url nuxt>詳細を確認する</v-btn>
      <v-spacer></v-spacer>
      </v-card-actions>

      <v-expand-transition>
        <div v-show="show">
          <v-divider></v-divider>
        </div>
      </v-expand-transition>   
    </v-card>
  </v-col>
  </v-row>
  </v-container>
  </div>
</template>

<style>
  img {
    width: 100px;
  }
</style>
<script>
export default {
  data () {
    return {
      cards: [],
      name: '',
      price: '',
    }
  },
  methods: {
    search () {
      const params = { card_name: this.name, card_price: this.price};
      if (this.price === "") {
        params["card_price"] = 10 ** 20
      } 
      const qs = new URLSearchParams(params);
      fetch(`http://127.0.0.1:5000/api?${qs}`)
      .then( response => {
        return response.json()
      })
      .then( response => {
        this.cards = [];
        for (let i = 0; i < response.length; i++) {
          let card = {
            "name": response[i]['name'],
            "price": response[i]['price'],
            "url": response[i]['url'],
            "img": response[i]['img']
          };
          this.cards.push(card)
        }
      })
      .catch( (err) => {
        this.msg = err // エラー処理
      });
    }
  }
}
</script>