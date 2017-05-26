import Vue from 'vue';
import App from './App';
import router from './router';
import  loading from './components/loading'
import  message from './components/message'
import util from './util.js';
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css';
import store from './store.js';
Vue.use(ElementUI)
Vue.use(util);
Vue.use(loading);
Vue.use(message);
Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
