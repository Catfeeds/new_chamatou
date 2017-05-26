import  messagetmp from './message.vue';
const  message = {
   install:function (Vue) {
     Vue.component('v-msg',messagetmp);
   }
}
export  default  message;
