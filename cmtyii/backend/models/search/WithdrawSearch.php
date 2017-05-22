<?php

namespace backend\models\search;

use backend\models\Shoper;
use backend\models\SpStore;
use backend\module\statistics\models\Base;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Withdraw;

/**
 * WithdrawSearch represents the model behind the search form about `backend\models\Withdraw`.
 */
class WithdrawSearch extends Withdraw
{
    public $store_sp_name;
    public $shoper_bank;
    public $shoper_bank_user;
    public $shoper_card_no;
    public $shoper_phone;
    public $shoper_boss;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Id', 'shoper_id', 'status'], 'integer'],
            [['amount'], 'number'],
            [['add_time'],'safe'],
            [['note','store_sp_name','shoper_bank','shoper_bank_user','shoper_card_no','shoper_phone'], 'safe'],
        ];
    }
    public function attributes()
    {
        return array_merge(parent::attributes(), ['storeSp_name']);
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
        $query->joinWith('shoper')->joinWith('store');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->setSort([
            'attributes' =>[
                'store_sp_name' => [
                    'asc' => ['sp_name' => SORT_ASC],
                    'desc' => ['sp_name' => SORT_DESC],
                    'label' => 'Store Sp Name'
                ],
                'status' => [
                    'asc' => ['status' => SORT_ASC],
                    'desc' => ['status' => SORT_DESC],
                    'label' => 'Store Sp Name'
                ],
                'shoper_bank' => [
                    'asc' => ['bank' => SORT_ASC],
                    'desc' => ['bank' => SORT_DESC],
                    'label' => 'Shoper Bank'
                ],
                'shoper_bank_user' => [
                    'asc' => ['bank_user' => SORT_ASC],
                    'desc' => ['bank_user' => SORT_DESC],
                    'label' => 'Shoper Bank User'
                ],
                'shoper_card_no' => [
                    'asc' => ['card_no' => SORT_ASC],
                    'desc' => ['card_no' => SORT_DESC],
                    'label' => 'Shoper Card No'
                ],
            ]
        ]);
        $this->load($params);
        if (!$this->validate()) {
            return $dataProvider;
        }

        if(isset($params['WithdrawSearch']['add_time'])){
            $time = Base::toGetTime($params['WithdrawSearch']['add_time']);
            $this->add_time = $params['WithdrawSearch']['add_time'];
            $query->andFilterWhere(['>', '{{%withdraw}}.add_time', strtotime($time['startTime'])]);
            $query->andFilterWhere(['<', '{{%withdraw}}.add_time', strtotime($time['endTime'])]);
        }

        $query->andFilterWhere([
            'shoper_id' => $this->shoper_id,
            'amount' => $this->amount,
            '{{%withdraw}}.status' => $this->status,
        ]);
        $query->andFilterWhere(['like', 'sp_name', $this->store_sp_name]);
        $query->andFilterWhere(['like', 'phone', $this->shoper_phone]);
        $query->andFilterWhere(['like', 'boss', $this->shoper_boss]);
        $query->andFilterWhere(['like', 'card_no', $this->shoper_card_no]);
        $query->andFilterWhere(['like', 'note', $this->note]);

        return $dataProvider;
    }
}
