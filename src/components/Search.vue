<template>
<div>
  <div class="search">
    <v-card color="success">
      <v-card-title class="form-title" align="center">Cryspe-prices</v-card-title>
      <v-card-text>
        <v-form>
          <v-container>
            <v-row class="blue lighten-4" justify="center">
            <v-col cols="12" md="12">
              <v-text-field v-model="name" prepend-icon="address-card" label="カード名" />
            </v-col>
            <v-col cols="12" md="12">
              <v-text-field v-model="price" prepend-icon="usd-circle" label="値段" />
            </v-col>
            </v-row>
          </v-container>
          <v-card-actions>
            <v-btn large @click="search()">検索</v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </div>
  <Cards :cards="cards"/>
</div>
</template>

<script>
import Cards from './Cards.vue'
export default {
  components: {
    Cards
  },
  name: 'Search',
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
      fetch(`https://crypt-api.herokuapp.com/api?${qs}`)
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

<style>
  .search {
    padding: 30px 70px;
    max-width: 1000px;
    margin: 0 auto;
  }
  .form-title {
    text-align: center;
    font-size: 30px;
    margin: auto;
    padding: auto 10px;
    color: #fff;
    background: #000;
    border-radius: 20%;
  }
  .btn {
    text-align: center;
    float: left;
  }
</style>