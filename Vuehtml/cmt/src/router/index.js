import Vue from 'vue';
import Router from 'vue-router';
import business from '@/components/business/business.vue';
import member from '@/components/member/member.vue';
import repertory from '@/components/repertory/repertory.vue';
import statement from '@/components/statement/statement.vue';
import consume from '@/components/consume/consume.vue';
import setting from '@/components/setting/setting.vue';
import shouxin from '@/components/shouxin/shouxin.vue';
import  leavemessage from '@/components/leavemessage/leavemessage.vue';
import  content from '@/components/content/content.vue';
import  login from '@/components/login/login.vue';
import  information from '@/components/information/information.vue';
import  handwork from '@/components/handwork/handwork.vue';
import  notsupportbrowser from '@/components/notsupportbrowser/notsupportbrowser.vue';
Vue.use(Router);
export default new Router({
  routes: [
    {
      path:'/content',
      component:content,
      children:[
        {path: '/content/business', component: business},
        {path: '/content/member', component: member},
        {path: '/content/repertory', component: repertory},
        {path: '/content/statement', component: statement},
        {path: '/content/consume', component: consume},
        {path: '/content/setting', component: setting},
        {path: '/content/shouxin', component: shouxin},
        {path: '/content/leavemessage', component: leavemessage},
        {path: '/content/information', component: information},
        {path: '/content/handwork', component: handwork}
      ]
    },
    {path:'/login',component:login},
    {path:'/notsupportbrowser',component:notsupportbrowser},
    //{path:'*', redirect:'/content/business'}  //重定向
  ]
});

