<?php

namespace backend\models\search;

use backend\module\statistics\models\Base;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Salesman;

/**
 * SalesmanSearch represents the model behind the search form about `backend\models\Salesman`.
 */
class SalesmanSearch extends Salesman
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['username','add_time' ,'phone'], 'safe'],
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
        $query = Salesman::find();

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

        if(isset($params['SalesmanSearch']['add_time'])){
            $time = Base::toGetTime($params['SalesmanSearch']['add_time']);
            $this->add_time = $params['SalesmanSearch']['add_time'];
            $query->andFilterWhere(['>', 'add_time', strtotime($time['startTime'])]);
            $query->andFilterWhere(['<', 'add_time', strtotime($time['endTime'])]);
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
             ->andFilterWhere(['like', 'phone', $this->phone]);

        return $dataProvider;
    }
}
