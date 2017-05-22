<?php

namespace backend\models\search;

use backend\module\statistics\models\Base;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Message;

/**
 * MessageSearch represents the model behind the search form about `backend\models\Message`.
 */
class MessageSearch extends Message
{
    public $store_name  = '';

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'store_id', 'type', 'status', 'delete_tag', 'delete_time'], 'integer'],
            [['content', 'phone', 'username','store_name','add_time', 'title'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {

        $query = Message::find();
        $query->where(['delete_tag' => 0])->joinWith('store');
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        if(isset($params['MessageSearch']['add_time'])){
            $time = Base::toGetTime($params['MessageSearch']['add_time']);
            $this->add_time = $params['MessageSearch']['add_time'];
            $query->andFilterWhere(['>', '{{%message}}.add_time', strtotime($time['startTime'])]);
            $query->andFilterWhere(['<', '{{%message}}.add_time', strtotime($time['endTime'])]);
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'shoper_id' => $this->shoper_id,
            'store_id' => $this->store_id,
            'type' => $this->type,
            'status' => $this->status,
            'delete_tag' => $this->delete_tag,
            'delete_time' => $this->delete_time,
        ]);

        $query->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'sp_name', $this->store_name]);

        return $dataProvider;
    }
}
