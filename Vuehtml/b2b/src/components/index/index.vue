<template>
  <div class="content-left g-left ">
   <div style="height:78px;width: 100%;position: absolute;left: 0;margin-top: -84px;border-bottom: 4px solid #777">
     <div style="width: 1000px;margin: auto;height: 78px;line-height: 78px;">
       <h3 class="classify g-left">分类</h3>
       <ul class="classify-list g-left g-position-relative" style="width: 600px;">
         <li :class="{'active':category.id==categoryId}" v-for="(category,index) in classifyList" v-if="index<5" @click="changeCate(category.id,category.cate_name)">{{category.cate_name}}</li>
         <li @click="getCateMore()">更多>></li>
         <ul v-show="cateShow" class=" g-position-absolute classify-more" :class="{'classify-more-show': cateShow}">
           <li :class="{'active':category.id==categoryId}" v-for="(category,index) in classifyList"  @click="changeCate(category.id,category.cate_name)">{{category.cate_name}}</li>
           <li @click="changeCate('','全部')">全部</li>
         </ul>
       </ul>
       <div class="search">
          <input type="text" id="keyword" placeholder="输入关键词" v-model="searchKeywords"/>
          <p id="tosearch" @click="search()">搜索</p>
       </div>
     </div>
   </div>
    <div class="crumbs">
      <p class="g-left">分类&nbsp;>&nbsp;{{categoryName}}</p>
      <div class="g-right">
        排序
        <select v-model="searchSort" @change="changeSort()">
          <option value="1">销量</option>
          <option value="-2">价格↑</option>
          <option value="2">价格↓</option>
          <option value="-3">时间↑</option>
          <option value="3">时间↓</option>
        </select>
      </div>
    </div>
    <!--商品列表-->
    <div class="goodslist g-position-relative">
      <div v-if="emptyShow" style="text-align: center;color: #777;line-height: 50px;font-size: 16px;">
        <i class="el-icon-information" style="font-size: 18px"></i>&nbsp;没有找到您想要的商品!
      </div>
      <ul>
        <li v-for="(goods,index) in goodsList.list">
          <div class="goodslist-img g-position-relative">
            <router-link :to="{name:'goodsdetail',params:{id:goods.Id }}">
            <img :src="imgUrl+goods.cover"/>
            </router-link>
          </div>
          <p class="g-text-ellipsis goodslist-title">{{goods.goods_name}}</p>
          <p class="goodslist-price"><span>￥&nbsp;{{goods.price}}</span>/{{goods.spec}}</p>
          <div class="goodlist-num ">
            <p class="g-left">数量</p>
            <div class="g-right caozuo">
              <span class="" @click="changeNum('prve',goods.Id)">－</span>
              <span class="" @click="changeNum('next',goods.Id)">＋</span>
            </div>
            <div class="g-right num">
              <input :id="'num'+goods.Id" value="1"   />
            </div>
          </div>
          <div class="addcart" v-if="goods.store>0" @click="addCart(goods.Id)">
            加入购物车
          </div>
          <div class="addcart"  style="background: #666;color: #fff" v-if="goods.store<=0">
            (库存不足)
          </div>
        </li>
      </ul>
      <!--分页条-->
      <div class="page clearfix">
        <div class="linklist">
          <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev')">上一页</a>
          <a href="javascript:void(0)" v-for="(pages,index) in pageList"  :class="{'active' : (page==pages)}"  @click="changePage(pages)">
            {{pages==0?'...':pages}}
          </a>
          <a class="next" href="javascript:void(0)" @click="changePage(page,'next')">下一页</a>
        </div>
      </div>
      <!--分页条/end-->
      <router-link to="/cart" >
      <div class="g-position-absolute cart" id="cart">
        <i class="icon iconfont icon-gouwuchexiantiao" style="font-size: 30px;color: #fff"></i>
        <span style="position: absolute;left: -2px;top: -2px;padding:2px 7px;line-height:20px;border-radius:50% ;display: block;background: #000;color: #fff;" v-show="getCount!=0">{{getCount}}</span>
      </div>
      </router-link>
    </div>
    <!--商品列表/end-->
    
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--loading-->
    <!--弹出框-->
    <v-msg  :msg="msg" :msgShow="msgShow" :msgType="msgType"></v-msg>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex';
  export default{
  	data(){
  		return {
        keyWords:'',
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
        classifyList:[],
        goodsList:[],
        categoryId:'',
        categoryName:'全部',
        cateShow:false,
        searchKeywords:'',
        searchSort:1,
        page:1,
        pageList:[],
        contentShow:false,
        emptyShow:false,
        userInfo:[],//获取用户信息
      }
    },
    computed:mapGetters(['getCount']),
    methods:{
  		//获取分类
      getCategory(){
      	var _this=this;
      	this.ajax(this.port.getGoodsClassify,{},'post',function (res) {
      	
          if(res.code==1){
            _this.classifyList=[];
            _this.classifyList=res.data;
          }
        })
      },
      //切换分类
      changeCate(id,name){
      	var _this=this;
      	this.categoryId=id;
      	
      	this.categoryName=name;
        this.cateShow=false;
        this.getGoodsList();
      },
      //显示更多分类
      getCateMore(){
        var _this=this;
        this.cateShow=!this.cateShow;
        $('.classify-more').hover(function () {
          _this.cateShow=true;
        },function () {
          _this.cateShow=false;
        })
      },
      //排序
      changeSort(){
        this.getGoodsList();
      },
      //搜索
      search(){
      	if(this.searchKeywords==''){
          this.msgHint('error','请输入关键词');
      		return;
        }
        this.getGoodsList();
      },
      //初始化商品数据
      getGoodsList(){
      	var _this=this;
      	const data={
      		cate_id:_this.categoryId,
      		sort:_this.searchSort,
      		keyword:_this.searchKeywords,
      		page:_this.page,
        }
      	this.ajax(this.port.getGoodsList,data,'get',function (res) {
          if(res.code==1){
          	_this.goodsList=[];
          	_this.goodsList=res.data;
          	_this.getpage(_this.page);
          	if(res.data.list.length==0){
              _this.emptyShow=true;
            }else{
              _this.emptyShow=false;
            }
          }
        })
      },
      changePage(page,type){
        if(Number(page)){
          var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.page = page;
                _this.getpage(page);
                _this.getGoodsList();
              } else {
                return;
              }
            } else {
              if (page < _this.goodsList.pageNum) {
                page++;
                _this.page = page;
                _this.getpage(page);
                _this.getGoodsList();
              } else {
                return;
              }
            }
          }else{
            _this.page=page;
            _this.getpage(page);
            _this.getGoodsList();
          }
        }
      },
      getpage(page){
        var _this=this;
        if(_this.goodsList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.pageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.pageList.push(0);
              }else{
                _this.pageList.push(i);
              }
            }
            _this.pageList.push(_this.info.pageNum);
            _this.page=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.goodsList.pageNum-2){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.pageList.push(i);
            }
            _this.pageList.push(0,_this.info.pageNum);
            _this.page=page;
          }
          //最后几页
          if(_this.goodsList.pageNum-2<=page && page<=_this.goodsList.pageNum){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=_this.goodsList.pageNum-6;i<=_this.goodsList.pageNum;i++){
              _this.pageList.push(i);
            }
            _this.page=page;
          }
        }else{
          _this.page=page;
          _this.pageList=[];
          for(let i=1;i<=_this.goodsList.pageNum;i++){
            _this.pageList.push(i);
          }
        }
      },
      //更改数量
      changeNum(type,id){
      	var _this=this;
      	var num = $('#num'+id).val();
      	if(type=='prve'){
      		if(num>1){
      			num--;
            $('#num'+id).val(num);
          }else{
      			return;
          }
        }else{
          num++;
          $('#num'+id).val(num);
        }
      },
      //添加购物车
      addCart(id){
        var _this=this;
        var num = $('#num'+id).val();
        var data={
        	goods_id:id,
          goods_num:num
        }
        if(num>999){
        	_this.msgHint('error','单件商品购买数量不能超过999');
        	return;
        }
        this.ajax(this.port.addCart,data,'post',function (res) {
          if(res.code==1){
            _this.msgHint('success','添加购物车成功');
            _this.getUserInfo();
          }else{
            _this.msgHint('error',res.msg)
          }
        })
        
      },
      //获取用户信息
      getUserInfo(){
      	var _this=this;
      	this.ajax(this.port.getUserInfo,{},'get',function (res) {
      		if(res.code==1){
      			_this.userInfo=[];
      			_this.userInfo=res.data;
            _this.$store.commit('setCount',_this.userInfo.cart)
          }
        },false)
      },
    },
    mounted(){
  		this.getCategory();
      this.getGoodsList();
      this.getUserInfo();
      var window_Width = $(window).width();
    	var fixed_Right = (window_Width-1000)/2 + 230 + 'px';
    	var fixed_bottom = '10%';
    	$('#cart').css({
    		right:fixed_Right,
    		bottom:fixed_bottom
    	})
      
     
    },
    updated(){
      $('.num input').on('input',function () {
      	var num = $(this).val();
          if(!/^[1-9]{1}\d{0,9}$/.test(num)){
          
            $(this).val('');
            $(this).focus();
          }
      })
      $('.num input').on('blur',function () {
        var num = $(this).val();
        if(!/^[1-9]{1}\d{0,9}$/.test(num)){
          $(this).val(1);
          $(this).focus();
        }
      })
    }
      
  }
</script>
<style scoped>
  .cart{
  	width: 55px;
    height: 55px;
    background: rgba(236,42,18,1);
    border-radius: 55px;
    text-align: center;
    line-height: 55px;
    color: #fff;
    cursor: pointer;
  }
  #cart{
  	position: fixed;
  }
  .goodslist ul li{width:185px;margin-right: 10px;display: block;float:left;margin-bottom: 10px;position: relative;background: #f5f5f5;cursor: pointer;
    box-shadow: 0px 0px 10px #ccc;
    -webkit-box-shadow: 0px 0px 10px #ccc;
    -moz-box-shadow: 0px 0px 10px #ccc;
    transition: all 0.5s;
    -weblit-transition: all 0.5s;
    -moz-transition: all 0.5s;
  }
  .goodslist ul li:hover{
    box-shadow: 0px 0px 15px #444;
    -weblit-box-shadow: 0px 0px 15px #444;
    -moz-box-shadow: 0px 0px 15px #444;
    transition: all 0.5s;
    -weblit-transition: all 0.5s;
    -moz-transition: all 0.5s;
  
  }
  .goodslist-detail h3{margin-bottom: 5px;margin-top: 25px;}
  .goodslist ul li:nth-child(4n){margin-right: 0px;}
  .goodslist-img{text-align: center;margin-top: 7px;}
  .goodslist-title{width: 170px;margin: auto;color: #777;}
  .goodslist ul li img{width:170px;height: 150px;}
  .goodlist-num{width: 170px;margin: auto;color: #777;height: 30px;line-height: 30px;margin-top: 10px;}
  .goodlist-num .num input{width: 40px;text-align: center;outline: none;height: 30px;margin-right: 3px;}
  .goodlist-num .caozuo{width: 20px;text-align: center;outline: none;}
  .goodlist-num span{line-height: 100%;float:left;display: inline-block;border: 1px solid #d5d5d5;
    background: #fff;margin-bottom: 3px;cursor: pointer;}
  .addcart{font-size:15px;height:40px;background: #ffdfd7;text-align: center;
    clear: both;margin-top:15px;cursor: pointer;line-height: 40px;transition: all .5s;color: #ed2e15}
  .addcart:hover{background: #ec2a12;transition: all .5s;color: #fff;}
  .goodslist-price{color: #999;width: 170px;margin: auto;}
  .goodslist-price span{color: red;font-size: 18px;}
  
  .classify{
    color: #c1000a;
    width: 70px;
    text-align: center;
    font-size: 20px;
    border-bottom: 4px solid #c1000a;
  }
  .classify-list{height:34px;margin-top:22px; line-height: 34px}
  
  .classify-list li{display: inline-block;padding:0px 10px ;color:#777;height: 34px;border-radius: 3px;cursor: pointer;
    margin-right: 5px;
    transition: all 0.5s;
  }
  .classify-list li.active{background: #ec2a12;color:#fff;}
  .classify-list li:hover{background:#ec2a12;color:#fff;transition: all 0.5s; }
  .classify-more{left:0px;top:0px;z-index: 99;background: #ffdfd7;
    box-shadow:0px 0px 5px #999;
    -webkit-box-shadow:0px 0px 5px #999;
    -moz-box-shadow:0px 0px 5px #999;
    padding: 5px;
    opacity: 0;
    transition: all .5s;
  }
  .classify-more-show{
  	min-width: 600px;
    min-height: 150px;
    opacity: 1;
  }
  .search{
    width:310px;
    height:50px;
    line-height: 50px;
    float:right;
    margin-top: 14px;
   
  }
  .search input{width: 210px;float:left;border: none;height: 50px;text-indent: 10px;outline: none; box-shadow:0px 0px 5px #999 inset;
    -webkit-box-shadow:0px 0px 5px #999 inset;;-moz-box-shadow:0px 0px 5px #999 inset;
  }
  .search p{width: 100px;text-align: center;font-size: 18px;float:left;background: #ad410f;color:#fff;cursor: pointer}
  .crumbs{
    height: 50px;line-height: 50px; color: #777;
  }
  .crumbs p{font-size: 16px;color:#777;text-indent: 15px;}
  .crumbs select{
    width: 150px;
    height:35px;
    color: #777;
    cursor: pointer;
  }
  .page{
   
    clear: both;
    margin: 0 auto;
    width: 480px;
    text-align: center;
    padding-top: 30px;
  }
  .linklist a{
    color: #777;
    text-decoration: none;
    padding: 5px 8px;
    margin: 0px 3px;
    transition: all 0.2s;
  }
  .linklist a:hover,.linklist a.active{
    color: #fff;
    text-decoration: none;
   
    background: #e63100;
    border-radius: 3px;
    transition: all 0.2s;
  }
</style>
