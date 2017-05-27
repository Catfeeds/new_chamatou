import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);
var state ={
    count:0
};
const mutations={
    setCount(state,c){
      state.count=c;
    },
    // setCount(){
    //
    // }
};
const getters={
   getCount(state){
     return state.count;
   }
}
export default new Vuex.Store({
  state,
  mutations,
  getters
})
