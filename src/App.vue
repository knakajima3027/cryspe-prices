<template>
  <div>
    <v-app-bar color="gray accent-4" dark>
    <v-toolbar-title>Cryspe Prices</v-toolbar-title>
    </v-app-bar>
      <div class="reference">
      <v-expansion-panels>
        <v-expansion-panel>
        <v-expansion-panel-header>使い方・概要</v-expansion-panel-header>
        <v-expansion-panel-content>
          <ul>
            <li>クリプトスペルズのカードを販売している各サイトの出品情報をまとめて検索することができます。</li>
            <li>現在は「Magi」,「Eth Market」の販売情報を取得できます。</li>
            <li>検索結果は「値段」で入力された額以下のカードが安い順に表示されます。</li>
            <li>イーサリアムで販売されているカードは、データ取得時の相場で日本円に換算して表示しています。</li>
          </ul>
        </v-expansion-panel-content>
      </v-expansion-panel>
      </v-expansion-panels>
      </div>
  <Search/>
  </div>
</template>

<script>
import Search from './components/Search.vue'
export default {
  components: {
    Search
  }
}
</script>

<style>
  body {
    font-family: Arial,"ヒラギノ角ゴ Pro W3","Hiragino Kaku Gothic Pro",Osaka,"メイリオ",Meiryo,"ＭＳ Ｐゴシック","MS PGothic",sans-serif;
    background: #F4F5F7;
  }
  .reference {
    padding: 15px 30px;
    max-width: 1000px;
    margin: 0 auto;
  }
  ul {
    padding: 0 30px;
  }
  li {
    font-size: 16px;
    margin-bottom: 10px;
  }
</style>