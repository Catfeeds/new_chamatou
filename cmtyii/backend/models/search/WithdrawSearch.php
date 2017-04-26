<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Withdraw;

/**
 * WithdrawSearch represents the model behind the search form about `backend\models\Withdraw`.
 */
class WithdrawSearch extends Withdraw
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Id', 'shoper_id', 'status', 'add_time'], 'integer'],
            [['amount'], 'number'],
            [['note'], 'safe'],
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
        $query = Withdraw::find();

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
            'Id' => $this->Id,
            'shoper_id' => $this->shoper_id,
            'amount' => $this->amount,
            'status' => $this->status,
            'add_time' => $this->add_time,
        ]);

        $query->andFilterWhere(['like', 'note', $this->note]);

        return $dataProvider;
    }
}
