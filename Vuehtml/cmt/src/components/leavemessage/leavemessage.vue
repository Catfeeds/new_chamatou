<template>
  <div>
    <div class="contviewtab">
      <a href="javascript:void(0);"    class="chageclass  current"  @click="changeTable(0)">留言管理</a>
      <a href="javascript:void(0);"    class="chageclass" @click="changeTable(1)">留言列表</a>
    </div>
    <!--留言管理-->
    <div class="bench white-scroll  msgshow  businesslist">
      <div class="bench_entry" style="background: #fff;width: 100%;padding: 15px 10px;">
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="messagelist">
          <label>标题:</label>
          <input type="text"   id="msg-title" v-model="msgTitle"/>
        </div>
        <div class="messagelist">
          <label>联系人:</label>
          <input type="text"   id="msg-user" v-model="msgUser"/>
        </div>
        <div class="messagelist">
          <label>电话:</label>
          <input type="text"   id="msg-phone" v-model="msgPhone"/>
        </div>
        <div class="messagelist">
          <label>留言主题:</label>
          <select id="msg-them" v-model="msgThem">
            <option value="0">--请选择主题--</option>
            <option value="1">培训支持</option>
            <option value="2">活动申请</option>
            <option value="3">广告设计</option>
          </select>
        </div>
        <div class="msgtext">
          <label>留言内容:</label>
         <textarea   v-model="msgContent" ></textarea>
        </div>
        <div class="msgbtn">
          <p id="msg-btn" @click="addMsg();">提交留言</p>
        </div>
      </div>
    </div>
    <!--留言管理/end-->
    <!--留言列表-->
    <div class="msglist display-none msgshow" >
      <div class="bench white-scroll member" id="globaltable" style="display: block;">
        <div class="globaltable r5px white-scroll"  >
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>时间</td>
              <td width="20%">标题</td>
              <td width="20%">留言主题</td>
              <td width="10%">联系人</td>
              <td width="10%">联系电话</td>
              <td>操作</td>
            </tr>
            </tbody>
            <tbody>
            <tr v-for="(data,index) in msgList.dateList">
              <td>{{data.add_time}}</td>
              <td>{{data.title}}</td>
              <td>{{data.type}}</td>
              <td>{{data.username}}</td>
              <td>{{data.phone}}</td>
              <td>
                <a href="javascript:void(0)"  @click="changeMask('.drawerdetail',data.id);">查看</a>
              </td>
            </tr>
            </tbody>
            <tbody>
            <tr>
              <td colspan="11">
                <div>
                  <div class="page clearfix">
                    <div class="text">共<b>{{msgPage.pageCount}}</b>页<b>{{msgPage.dataCount}}</b>条记录</div>
                    <div class="linklist">
                      <a class="prev" @click="changePage(page,'prev');" href="javascript:void(0)">&nbsp;</a>
                      <a href="javascript:void(0)"   v-for="(pages,index) in msgPageList"  :class="{'current' : (page==pages)}"   @click="changePage(pages);" >{{pages}}</a>
                      <a class="next" @click="changePage(page,'next');" href="javascript:void(0)">&nbsp;</a>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
          </table>
        </div>
      </div>
      <!--loading-->
      <v-loading v-if="isLoading"></v-loading>
      <!--loading/end-->
      <div v-if="iSsuccess" class="bgblacks  in"></div>
    </div>
    <!--留言列表/end-->
    <!--留言详细信息-->
    <div class="drawerdetail flex  flex-v">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">留言详细信息</span>
          <a class="close fr" @click="closeMask('.drawerdetail')" href="javascript:void(0);"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>标题：</td>
              <td colspan="2">{{getmsgOne.title}}</td>
            </tr>
            <tr>
              <td>联系人：</td>
              <td colspan="2">{{getmsgOne.username}}</td>
            </tr>
            <tr>
              <td>电话：</td>
              <td colspan="2">{{getmsgOne.phone}}</td>
            </tr>
            <tr>
              <td>时间：</td>
              <td>{{getmsgOne.add_time}}</td>
            </tr>
            <tr>
              <td>留言主题：</td>
              <td colspan="2">{{getmsgOne.type}}</td>
            </tr>
            <tr>
              <td>留言内容：</td>
              <td colspan="3">{{getmsgOne.content}}</td>
            </tr>
            </tbody></table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
    </div>
    <div class="bgblack bgnone"></div>
    <!--留言详细信息/end-->
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--弹出层区、end-->
  </div>
</template>
<script>
  export  default{
    data(){
    	return{
        isLoading: false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgThem:0,
        msgTitle:'',
        msgPhone:'',
        msgContent:'',
        msgUser:'',
        msgList:[],
        getmsgOne:[],
        msgPageList:[],
        msgPage:[],
        page:1
      }
    },
    methods:{
    	//切换列表
    	  changeTable(id){
    	  	this.page=1;
    	  	this.initData();
    	  	$('.chageclass').eq(id).addClass('current').siblings('.chageclass').removeClass('current');
    	  	$('.msgshow').eq(id).removeClass('display-none').siblings('.msgshow').addClass('display-none');
        },
      //关闭弹窗
      closeMask(ele){
        $(ele).removeClass('in');
      },
      //打开弹窗
      changeMask(ele,id){
        this.getDetail(id);
      	$(ele).addClass('in');
      },
      //获取详细内容
      getDetail(id){
      	var _this=this;
      	    this.ajax(this.port.messageOne,{message_id:id},'GET',function(res){
      	    	if(res.code==1){
      	    		_this.getmsgOne=res.data;
              }
            })
      },
      //添加留言
      addMsg(){
        if(this.msgTitle==''){
          this.msgHint('标题不能为空');
          return
        }
        if(this.msgUser==''){
          this.msgHint('联系人不能为空');
          return
        }
          if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.msgPhone) || this.msgPhone=='') {
          this.msgHint('请填写正确手机号码');
          return
        }
        if(this.msgThem==0){
          this.msgHint('请选择主题');
          return
        }
        if(this.msgContent==''){
          this.msgHint('留言内容不能为空');
          return
        }
        var _this=this;
        const data={
        	content:this.msgContent,
          title:this.msgTitle,
          phone:this.msgPhone,
          username:this.msgUser,
          type:this.msgThem
        }
      this.ajax(this.port.messageCreate,data,'post',function(res){
      	if(res.code==1){
          _this.msgHint(res.msg);
          _this.msgContent='';
          _this.msgTitle='';
          _this.msgPhone='';
          _this.msgUser='';
          _this.msgThem=0;
          _this.initData();
          _this.changeTable(1);
        }else{
      		_this.msgHint(res.msg);
        }
      })
      },
      //分页
      changePage(page, type){
      	if(type){
          if (type == 'prev') {
            if (page > 1) {
              page--;
              this.page = page;
            }else{
            	return;
            }
          } else {
            if (page < this.msgList['page']['pageCount']){
              page++;
              this.page = page;
            }else{
            	return;
            }
          }
        }else{
      		if(page==this.page){
          return;
        }
          this.page=page;
         
        }
     
        this.initData();
      },
      //初始化数据
      initData(){
      	var _this=this;
      	var pages=this.page;
      	this.ajax(this.port.messageList,{page:pages},'GET',function(res){
      		if(res.code==1){
            _this.msgPageList=[];
            _this.msgPage=[];
            _this.msgList=res.data;
            _this.msgPage=res.data.page;
            for(var i=1;i<=res.data['page']['pageCount'];i++){
              _this.msgPageList.push(i);
            }
          }else{
      			_this.msgHint(res.msg);
          }
        })
        
      }
    },
    mounted(){
      var str = window.location.href;
      if(str.indexOf('leavemessage')!=-1){
        $('#navstr').html('留言');
      }
      this.initData();
    }
  }
</script>
<style scoped>
  .prompt{
    top:20%
  }
</style>
