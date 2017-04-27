<?php

namespace backend\models\search;

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
            [['id', 'shop_total', 'add_time'], 'integer'],
            [['username', 'phone'], 'safe'],
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

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'shop_total' => $this->shop_total,
            'add_time' => $this->addtime,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'phone', $this->phone]);

        return $dataProvider;
    }
}
