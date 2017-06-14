<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/6/12
 * Time: 16:29
 */

namespace frontend\models;


use yii\db\ActiveRecord;

class DrawRecord extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%sp_draw_record}}';
    }

    public function rules()
    {
        return [
            [['user_id','shoper_id','store_id','add_time'],'integer'],
        ];
    }

    /**
     * 用户抽奖后保存信息  用于判断当天只能抽奖一次
     */
    public function add()
    {
        $user = \Yii::$app->session->get('wx_user');
        $this->user_id = $user['id'];
        $this->shoper_id = \Yii::$app->session->get('shoper_id');
        $this->store_id = \Yii::$app->session->get('store_id');
        $this->add_time = date('Ymd',time());
        $this->save();
    }

    /**
     * 根据用户ID 店铺ID 门店ID 和时间查询该用户当天是否有过抽奖行为
     * @return int 0是未抽奖 1是已抽奖
     */
    public static function getRecord()
    {
        $user = \Yii::$app->session->get('wx_user');
        $re = self::find()->andWhere(['user_id'=>$user['id']])
                    ->andWhere(['shoper_id'=>\Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>\Yii::$app->session->get('store_id')])
                    ->andWhere(['add_time'=>date('Ymd',time())])
                    ->one();
        if($re){
            return 1;
        }
        return 0;
    }
}