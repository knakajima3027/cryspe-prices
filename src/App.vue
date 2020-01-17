<template>
  <div>
    <div class="search">
    <v-card align-content="center">
      <v-card-title class="title">クリスぺプライス</v-card-title>
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
    </div>

    
  <v-container>
    <v-row class="blue lighten-4" style="height: 450px;" justify="center" align-content="center">
    <v-col cols="6" xs="12" sm="6" md="3" lg="3" v-for="card in cards" v-bind:key="card.img">
      <v-card class="mx-auto" max-width="344px">  
        <v-img :src="card.img" height="300px"></v-img>
        <v-card-title>
          {{ card["name"] }}
        </v-card-title>
        <v-card-subtitle> 
          <strong>{{ card["price"] }} 円</strong> ({{ card["store"] }})
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
  .search {
    padding: 20px 60px;
    text-align: center;
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
            "img": response[i]['img'],
            "store": response[i]['store']
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