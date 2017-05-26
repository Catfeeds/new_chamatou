
<template>
  <div class="content-left g-left" style="padding-bottom: 200px;">
    <div class="head">
      <p class="g-left">地址管理</p>
      <router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
    </div>
    <div class="input-box">
      <span class="color-f">新增收货地址</span>
      <span style="padding-left: 5px;">电话号码、手机号选填一项，其余均为必填项</span>
    </div>
    <div class="input-box">
      <p >所在地区&nbsp;<span class="color-f">*</span></p>
      <select id="province" name="province" v-model="province"  @change="changeSite('p')">
        <option value="0">--请选择--</option>
        <option v-for="(p,index) in provinceList" :value="p.name">{{p.name}}</option>
      </select>
      <select id="city" name="city" v-model="city"   @change="changeSite('c')" >
        <option value="0">--请选择--</option>
        <option v-for="(c,index) in cityList" :value="c.name">{{c.name}}</option>
      </select>
      <select id="area" name="area" v-model="district"  @change="changeSite('d')" >
        <option value="0">--请选择--</option>
        <option v-for="(d,index) in districtList" :value="d.name">{{d.name}}</option>
      </select>
    </div>
    <div class="input-box clearfix">
      <p  class="g-left ">详细地址&nbsp;<span class="color-f">*</span></p>
      <textarea name="areadeta" class="areadeta g-left" v-model="addressDetail" placeholder="建议您如实填写收货地址信息"></textarea>
    </div>
    <div class="input-box">
      <p  >收&nbsp;货&nbsp;&nbsp;人<span class="color-f">*</span></p>
      <input type="text" name="username" v-model="userName" class="phone input-text" placeholder="请填写收货人姓名"/>
    </div>
    <div class="input-box">
      <p >邮政编码&nbsp;</p>
      <input type="text" name="postcode" v-model="yz_code" class="postcode input-text" placeholder="请填写邮编号码"/>
    </div>
    <div class="input-box">
      <p  >手机号码<span class="color-f">*</span></p>
      <input type="text" name="phone" v-model="phone" class="phone input-text" placeholder="请填写手机号码"/>
    </div>
    <div class="input-box">
      <p  >电话号码&nbsp;</p>
      <input type="text" name="tel" v-model="tel" class="tel input-text" placeholder="请填写电话号码"/>
    </div>
    <div class="input-box" style="min-height: 20px;height: 20px;">
      <span style="padding-right: 88px;" ></span>
      <label>
        <input type="checkbox" name="default" class="default g-left" v-model="default_address" />
        <span style="font-weight: 500;line-height: 20px;" class="g-left">&nbsp;&nbsp;设置为默认收货地址</span>
      </label>
    </div>
    <div class="input-box" style="margin: 0;">
      <span style="padding-right: 88px;" class="g-left"></span>
      <div class="btn g-left" @click="addSite()" v-if="addressType=='add'">保存</div>
      <div class="btn g-left" @click="addSite()" v-if="addressType=='edit'">修改</div>
    </div>
    <!--表格-->
    <div class="color-f" style="margin: 30px 20px 5px;"></div>
    <table>
      <tr style="height: 48px;background: #f5f5f5;" >
        <td style="width: 65px;">收货人</td>
        <td style="width: 160px;">所在地区</td>
        <td style="width: 160px;">详细地址</td>
        <td style="width: 85px;">邮编</td>
        <td style="width: 110px;">手机/电话</td>
        <td style="width: 160px;">操作</td>
      </tr>
      <tr style="height: 48px;background: #f5f5f5;" v-for="(address,index) in addressList">
        <td style="width: 65px;">{{address.username}}</td>
        <td style="width: 160px;">{{address.province}}{{address.city}}{{address.district}}</td>
        <td style="width: 160px;" ><p class="g-text-ellipsis">{{address.address}}</p></td>
        <td style="width: 85px;">{{address.zip_code}}</td>
        <td style="width: 110px;">{{address.phone ?address.phone:address.tel }}</td>
        <td style="width: 160px;">
          <a class="color-f padding_r5" @click="editAddress(address.id,address.username,address.province,address.city,address.district,address.address,address.phone,address.zip_code,address.tel,address.default)">修改</a>|
          <a class="color-f padding_l5" @click="delAddress(address.id)">删除</a>
          <span class="default-text" v-if="address.default==1">默认地址</span>
        </td>
      </tr>
    </table>
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
  
  export default{
    data(){
      return{
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
        ressid:'',
        provinceList:[],
        cityList:[],
        districtList:[],
        province:'0',
        city:'0',
        district:'0',
        phone:'',
        tel:'',
        yz_code:'',
        addressDetail:'',
        default_address:false,
        userName:'',
        addressList:[],
        addressType:'add',
      }
    },
    methods: {
    	//修改地址
      editAddress(id,u,p,c,d,a,phone,y,t,ischeck){
      	this.ressid=id;
        this.province=p;
        this.city=c;
        this.district=d;
        this.phone=phone;
        this.tel=t;
        this.yz_code=y;
        this.addressDetail=a;
        if(ischeck==0){
          this.default_address=false;
        }else{
          this.default_address=true;
        }
        this.userName=u;
        this.locationInit(this.province,this.city,false);
        this.addressType='edit';
      },
      //删除地址
      delAddress(id){
      	var _this=this;
        this.ressid=id;
        this.$confirm('确定删除该地址吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          _this.ajax(_this.port.delAddress,{address_id:_this.ressid},'post',function (res) {
            if(res.code==1){
              _this.addressInit();
              _this.msgHint('success','地址删除成功！')
            }else{
              _this.msgHint('error',res.msg)
            }
          })
        }).catch(() => {
          //取消
        });
      },
      //添加地址
      addSite(){
        var _this=this;
        var data,url,checkdefault;
        if(this.province=='0'){
          this.msgHint('error','请选择省份');
          return;
        }
        if(this.city=='0'){
          this.msgHint('error','请选择城市');
          return;
        }
        if(this.district=='0'){
          this.msgHint('error','请选择区县');
          return;
        }
        if(this.addressDetail==''){
          this.msgHint('error','请填写正确的详细地址');
          return;
        }
        if(this.userName==''){
          this.msgHint('error','请填写收货人姓名');
          return;
        }
        if(!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.phone)){
          this.msgHint('error','请输入正确的手机号码');
          return;
        }
        if(this.default_address){
          checkdefault=1
        }else{
          checkdefault=0;
        }
        if(this.addressType=='add'){
          url=this.port.addAddresss;
          data={
            province:this.province,
            city:this.city,
            district:this.district,
            zip_code:this.yz_code,
            address:this.addressDetail,
            phone:this.phone,
            tel:this.tel,
            username:this.userName,
            default:checkdefault
          }
        }else{
          url=this.port.editAddresss;
          data={
            address_id:this.ressid,
            province:this.province,
            city:this.city,
            district:this.district,
            zip_code:this.yz_code,
            address:this.addressDetail,
            phone:this.phone,
            tel:this.tel,
            username:this.userName,
            default:checkdefault
          }
        }
        this.ajax(url,data,'post',function (res) {
          if(res.code==1){
          	_this.ressid='';
            _this.province='0';
            _this.city='0';
            _this.district='0';
            _this.phone='';
            _this.tel='';
            _this.yz_code='';
            _this.addressDetail='';
            _this.userName='';
            _this.default_address=false;
            _this.addressType='add';
            _this.addressInit();
          }else{
            _this.msgHint('error',res.msg);
          }
        })
      },
      //地区切换
      changeSite(type){
        if(type=='c'){
          this.district='0';
          this.locationInit(this.province,this.city,false);
        }else if(type=='d'){
        }else{
          this.city='0';
          this.district='0';
          this.locationInit(this.province,'',false);
        }
      },
      //初始化地址数据
      addressInit(){
        var _this=this;
        this.ajax(this.port.addressList,{},'get',function (res) {
          if(res.code==1){
            _this.addressList=[];
            _this.addressList=res.data;
          }
        })
      },
    },
    mounted(){
      this.locationInit(this.province,this.city,true);
    	this.addressInit();
    }
  }

</script>
<style scoped>
  .input-box{
    min-height: 36px;
    line-height: 36px;
    padding-left: 40px;
    margin: 10px 0;
  }
  .color-f{
    color: #ff4001;
  }
  .areadeta{
    width: 435px;
    height: 88px;
    border: 1px solid #eee;
    background: #f5f5f5;
    resize:none;
    text-indent: 5px;
  }
  .input-text{
    width: 238px;
    height: 34px;
    border: 1px solid #eee;
    background: #f5f5f5;
  }
  select{
    border: 1px solid #eee;
    background: #f5f5f5;
    height: 34px;
    line-height: 34px;
    min-width: 66px;
  }
  .default{
    border: 1px solid #eee;
    background: #f5f5f5;
    height: 18px;
    width: 18px;
  }
  table{
    margin-left: 20px;
    text-align: center;
  }
  tr{
    height: 66px;
    border: 1px solid #eee;
  }
  .default-text{
    padding-left: 10px;
    color: #c3c3c3;
  }
  input{
    padding-left: 5px;
  }
  a{
    cursor: pointer;
  }
  .input-box p{
    width: 90px;float: left;
  }
</style>
