import Vue from 'vue';
import App from './App';
import router from './router';
import  loading from './components/loading'
import  message from './components/message'
import util from './util.js';
Vue.use(util);
Vue.use(loading);
Vue.use(message);
Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
