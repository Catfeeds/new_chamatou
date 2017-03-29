import Vue from 'vue';
import Router from 'vue-router';
import business from '@/components/business/business.vue';
import member from '@/components/member/member.vue';
import repertory from '@/components/repertory/repertory.vue';
import statement from '@/components/statement/statement.vue';
import consume from '@/components/consume/consume.vue';
import serve from '@/components/serve/serve.vue';
import setting from '@/components/setting/setting.vue';
import  leavemessage from '@/components/leavemessage/leavemessage.vue';
Vue.use(Router);
export default new Router({
  routes: [
    {
      path: '/business',
      name: 'business',
      component: business
    },
    {
      path: '/member',
      name: 'member',
      component: member
    },
    {
      path: '/repertory',
      name: 'repertory',
      component: repertory
    },
    {
      path: '/statement',
      name: 'statement',
      component: statement
    },
    {
      path: '/consume',
      name: 'consume',
      component: consume
    },
    {
      path: '/serve',
      name: 'serve',
      component: serve
    },
    {
      path: '/setting',
      name: 'setting',
      component: setting
    },
    {
      path: '/leavemessage',
      name: 'leavemessage',
      component: leavemessage
    },
    {path:'*', redirect:'/business'}  //重定向
  ]
});
