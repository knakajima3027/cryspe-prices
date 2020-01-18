<template>
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
    </v-card>
  </v-col>
  </v-row>
  </v-container>

</template>

<script>
export default {
  name: 'Cards',
  props: {
    cards: Array
  }
}
</script>