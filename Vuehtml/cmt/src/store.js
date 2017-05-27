import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);
//状态数据定义
var state ={
  roleData:'',
  userInfo:'',
  storeInfo:'',
  isLogin:false,
}
//发生变化时执行的函数集合
const mutations= {
  //接受参数 ，参数就是actions里面参数，在这里接受的参数就是一个对应的方法
  //比如从anctions里面传过来一个增加的是参数（add ）  那么这里对应的就是  add(state){ 执行流程 }
  //设置全局role
  getLoginInfo(state, data){
    if(data){
      state.roleData = data['role'];
      state.userInfo = data['user'];
      state.storeInfo = data['store'];
      state.isLogin = true;
    }
  },
  //注销登录
  clearLogin(state){
    state.roleData = [];
    state.userInfo = [];
    state.storeInfo = [];
    state.isLogin = false;
  }
}
const actions={
   //接受
//   nnn:({
//     commit
//   })=>{
//     commit('nn');
//   }     在组件里面可以使用  this.$store.commit('参数' c)
}

//获取处理好的数据状态，他们是一个函数集合
 const getters={
    getInit(state){
       return  state;
    }
 }
 export  default  new  Vuex.Store({
   state,
   mutations,
   getters
 })
