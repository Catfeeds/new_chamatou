<?php

namespace backend\models\search;

use backend\models\Shoper;
use backend\models\SpStore;
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

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Id', 'shoper_id', 'status', 'add_time'], 'integer'],
            [['amount'], 'number'],
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
        $query->alias('w')
            ->select(['w.*', 'shoper.bank', 'shoper.bank_user', 'shoper.card_no', 'shoper.phone', 'store.sp_name'])
            ->leftJoin(['shoper'=> Shoper::tableName()], 'shoper.id = w.shoper_id')
            ->leftJoin(['store'=>SpStore::tableName()], 'store.shoper_id =  shoper.id');
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->setSort([
            'attributes' =>[
                'store_sp_name' => [
                    'asc' => ['store.sp_name' => SORT_ASC],
                    'desc' => ['store.sp_name' => SORT_DESC],
                    'label' => 'Store Sp Name'
                ],
                'shoper_bank' => [
                    'asc' => ['shoper.bank' => SORT_ASC],
                    'desc' => ['shoper.bank' => SORT_DESC],
                    'label' => 'Shoper Bank'
                ],
                'shoper_bank_user' => [
                    'asc' => ['shoper.bank_user' => SORT_ASC],
                    'desc' => ['shoper.bank_user' => SORT_DESC],
                    'label' => 'Shoper Bank User'
                ],
                'shoper_card_no' => [
                    'asc' => ['shoper.card_no' => SORT_ASC],
                    'desc' => ['shoper.card_no' => SORT_DESC],
                    'label' => 'Shoper Card No'
                ],
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
            'Id' => $this->Id,
            'shoper_id' => $this->shoper_id,
            'amount' => $this->amount,
            'w.status' => $this->status,
            'add_time' => $this->add_time,
        ]);

        $query->andFilterWhere(['like', 'note', $this->note]);

        return $dataProvider;
    }
}
