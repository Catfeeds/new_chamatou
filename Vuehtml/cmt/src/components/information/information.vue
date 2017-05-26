<template>
  <div class="contview">
    <div class="contviewtab">
      <a href="javascript:void(0);" class="current information" @click="changeNav(0)">未读消息({{cunt.unread}})</a>
      <a href="javascript:void(0);" class="information"  @click="changeNav(1)">已读消息({{cunt.read}})</a>
    </div>
    <div>
      <div class="bench white-scroll newmessage" style="top: 45px">
        <ul>
          <li class="flex r5px" v-for="(list,index) in List">
            <p class="flex-1">{{list.content}}</p><span>{{list.add_time}}</span>
          </li>
         
        </ul>
        <div>
           <div class="page clearfix" v-if="state==1">
	             <div class="text">共<b>{{pageNumList.pageNum}}</b>页<b>{{pageNumList.pageCount}}</b>条记录</div>
	             <div class="linklist">
	               <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
	               <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in pageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
	               <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
	             </div>
		       </div>
        </div>
      </div>
    </div>
    
    <!--报错模板-->
    <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
  	<!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
  </div>
</template>
<script>
  export default{
  	data(){
  		return {
  				isLoading: false,          //是否出现loading框
          iSsuccess:false,           //是否ajax请求完成
          msgShow: false,            //是否显示错误消息模态框
          msg: '',                   //错误消息提示内容
    			start_time:'2017-1-1',         //开单时间的开始
    			end_time:'2018-1-1',           //开单时间的结束
    			page:1,
        	pageList:[],
       	 	pageNumList:[],
       	 	cunt:[],//总条数
       	 	List:[],//数据
       	 	readList:[],//数据
       	 	state:0,//未读还是已读状态
      }
    },
    methods:{
      changeNav(id){
      	var _this = this;
        $('.information').eq(id).addClass('current').siblings('.information').removeClass('current');
      	if(id==0){
      		_this.state=0;
      		_this.page=0;
        }else{
      		_this.state=1;
        }
        _this.getCunt();
        _this.getList()
      },
      //获取总消息数据
      getCunt(){
      	 var _this = this;
      	 _this.ajax(_this.port.information,{},'get',function(res){
      	 		if(res.code==1){
      	 			 _this.cunt=[];
          	   _this.cunt =res.data;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //获取消息数据
      getList(){
      	 var _this = this;
      	 var newsUrl= _this.port.unread;
      	 if(_this.state==1){
      	 		newsUrl= _this.port.read;
      	 }
      	 _this.ajax(newsUrl,{page:_this.page},'get',function(res){
      	 		if(res.code==1){
      	 			if(_this.state==1){
      	 				_this.List=[];
      	 				_this.pageList=[];
      	 				_this.pageNumLIst=[];
      	 				_this.List=res.data.list;
          	   	_this.pageNumList =res.data;
	          	 	_this.getpage(_this.page);
      	 			}else{
      	 				_this.List=[];
          	   	_this.List =res.data;
      	 			}
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
       //分页
      changePage(page,type){
	        if(Number(page)){
	          var _this=this;
	          if(type) {
	            if (type == 'prev') {
	              if (page > 1) {
	                page--;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getList();
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getList();
	              } else {
	                return;
	              }
	            }
          }else{
            _this.page=page;
            _this.getpage(page);
            _this.getList();
          }
        }
      },
      getpage(page){
        var _this=this;
        if(_this.pageNumList.pageNum>10){
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
            _this.pageList.push(_this.pageNumList.pageNum);
            _this.page=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.pageNumList.pageNum-2){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.pageList.push(i);
            }
            _this.pageList.push(0,_this.pageNumList.pageNum);
            _this.page=page;
          }
          //最后几页
          if(_this.pageNumList.pageNum-2<=page && page<=_this.pageNumList.pageNum){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=_this.pageNumList.pageNum-6;i<=_this.pageNumList.pageNum;i++){
              _this.pageList.push(i);
            }
            _this.page=page;
          }
        }else{
          _this.page=page;
          _this.pageList=[];
          for(let i=1;i<=_this.pageNumList.pageNum;i++){
            _this.pageList.push(i);
          }
        }
      }
    },
    mounted(){
      var str = window.location.href;
      if(str.indexOf('information')!=-1){
        $('#navstr').html('消息');
      }
  		this.getCunt();
  		this.getList();
    }
  }
</script>

