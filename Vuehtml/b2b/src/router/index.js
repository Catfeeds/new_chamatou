import Vue from 'vue';
import Router from 'vue-router';
import index from '@/components/index/index.vue';
import goodsdetail from '@/components/index/goodsdetail.vue';
import address from '@/components/address/addresslist.vue';
import cart from '@/components/cart/cart.vue';
import orderlist from '@/components/orderlist/orderlist.vue';
import count from '@/components/count/count.vue';
import credit from '@/components/credit/credit.vue';

Vue.use(Router);
export default new Router({
  routes: [
      {path: '/index', name:'index',component: index},
      {path: '/address',  name:'address',component: address},
      {path: '/cart', name:'cart', component: cart},
      {path: '/orderlist', name:'orderlist', component: orderlist},
      {path: '/count/:id', name:'count', component: count},
      {path: '/credit', name:'credit', component: credit},
      {path: '/goodsdetail/:id', name:'goodsdetail', component: goodsdetail},
    {path:'*', redirect:'/index'}  //重定向
  ]
});

