import  LoadingCom from './loading.vue';
const  loading = {
   install:function(Vue){
     Vue.component('v-loading',LoadingCom);
   }
}
export  default  loading;
