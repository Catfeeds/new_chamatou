import Vue from 'vue'
import Router from 'vue-router'
import main from '@/components/main.vue'
import foot from '@/components/foot/foot.vue'
import nearbyTea from '@/components/nearbyTea/nearbyTea.vue'
import center from '@/components/center/center.vue'
import record_expense from '@/components/record_expense/record_expense.vue'
import record_topUp from '@/components/record_topUp/record_topUp.vue'
import myOrder from '@/components/myOrder/myOrder.vue'
import bindPhone from '@/components/bindPhone/bindPhone.vue'
import topUp from '@/components/topUp/topUp.vue'
import bindSucceed from '@/components/bindSucceed/bindSucceed.vue'
import clubCard from '@/components/clubCard/clubCard.vue'
import teaDeta from '@/components/teaDeta/teaDeta.vue'
import goodsList from '@/components/goodsList/goodsList.vue'
import orderDeta from '@/components/orderDeta/orderDeta.vue'
//import cartcontrol from 'components/cartcontrol/cartcontrol';
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/mian',
      component: main,
      children:[
        {path: '/main/nearbyTea', component: nearbyTea},
        {path: '/main/center', component: center},
      ]
    },
    {
      path:'/record_expense',
      name:'record_expense',
      component:record_expense
    },
    {
      path:'/record_topUp',
      name:'record_topUp',
      component:record_topUp
    },
    {
      path:'/myOrder',
      name:'myOrder',
      component:myOrder
    },
    {
      path:'/bindPhone',
      name:'bindPhone',
      component:bindPhone
    },
    {
      path:'/topUp',
      name:'topUp',
      component:topUp
    },
    {
      path:'/bindSucceed',
      name:'bindSucceed',
      component:bindSucceed
    },
    {
      path:'/clubCard',
      name:'clubCard',
      component:clubCard
    },
    {
      path:'/teaDeta',
      name:'teaDeta',
      component:teaDeta
    },
    {
      path:'/goodsList',
      name:'goodsList',
      component:goodsList
    },
    {
      path:'/orderDeta',
      name:'orderDeta',
      component:orderDeta
    },


    //{path:'*', redirect:'/main/nearbyTea'}  //重定向（进来的默认跳转位置）
  ]
})
