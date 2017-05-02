<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Shoper;

/**
 * ShoperSearch represents the model behind the search form about `backend\models\Shoper`.
 */
class ShoperSearch extends Shoper
{
    public $sp_name;
    public $area;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'withdraw_type', 'status', 'salesman_id', 'add_time', 'sp_status'], 'integer'],
            [['boss', 'phone', 'contract_no', 'bank', 'bank_user', 'card_no'], 'safe'],
            [['credit_amount', 'credit_remain', 'beans_incom', 'total_amount', 'withdraw_total'], 'number'],
            ['sp_name','safe']
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
        $query = Shoper::find();

        $query->joinWith(['sp_name']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' =>  ['pageSize'=>10],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ]
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
            'credit_amount' => $this->credit_amount,
            'withdraw_type' => $this->withdraw_type,
            'credit_remain' => $this->credit_remain,
            'status' => $this->status,
            'salesman_id' => $this->salesman_id,
            'add_time' => $this->add_time,
            'beans_incom' => $this->beans_incom,
            'total_amount' => $this->total_amount,
            'withdraw_total' => $this->withdraw_total,
            'sp_status' => $this->sp_status,
        ]);

        $query->andFilterWhere(['like', 'boss', $this->boss])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'contract_no', $this->contract_no])
            ->andFilterWhere(['like', 'bank', $this->bank])
            ->andFilterWhere(['like', 'bank_user', $this->bank_user])
            ->andFilterWhere(['like', 'card_no', $this->card_no]);

        return $dataProvider;
    }
}
