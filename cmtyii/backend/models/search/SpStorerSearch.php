<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SpStore;

/**
 * SpStorerSearch represents the model behind the search form about `backend\models\SpStore`.
 */
class SpStorerSearch extends SpStore
{

    /**
     * 省
     * @var
     */
    public $province_name;

    /**
     * 市
     * @var
     */
    public $city_name;

    /**
     * 区
     * @var
     */
    public $area_name;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'provinces_id', 'city_id', 'area_id'], 'integer'],
            [['sp_name', 'address', 'add_detail', 'sp_phone', 'cover', 'intro', 'province_name','city_name', 'area_name', 'add_time'], 'safe'],
            [['lat', 'lon'], 'number'],
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
        $query = SpStore::find();
        $query->joinWith(['province as province'])->where(['province.level'=>1]);
        $query->joinWith(['city as city'])->where(['city.level'=>2]);
        $query->joinWith(['area as area'])->where(['area.level'=>3]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $sort = $dataProvider->getSort();
        $sort->attributes['province_name'] = [
            'asc' => ['province.name' => SORT_ASC],
            'desc' => ['province.name' => SORT_DESC],
            'label' => 'Province Name'
        ];
        $sort->attributes['city_name'] = [
            'asc' => ['city.name' => SORT_ASC],
            'desc' => ['city.name' => SORT_DESC],
            'label' => 'city Name'
        ];
        $sort->attributes['area_name'] = [
            'asc' => ['area.name' => SORT_ASC],
            'desc' => ['area.name' => SORT_DESC],
            'label' => 'area Name'
        ];

        $this->load($params);


        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'shoper_id' => $this->shoper_id,
            'lat' => $this->lat,
            'lon' => $this->lon,
            'provinces_id' => $this->provinces_id,
            'city_id' => $this->city_id,
            'area_id' => $this->area_id,
            'add_time' => $this->add_time,
        ]);

        $query->andFilterWhere(['like', 'sp_name', $this->sp_name])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'add_detail', $this->add_detail])
            ->andFilterWhere(['like', 'sp_phone', $this->sp_phone])
            ->andFilterWhere(['like', 'intro', $this->intro])
            ->andFilterWhere(['like', 'province.name', $this->province_name])
            ->andFilterWhere(['like', 'city.name', $this->city_name])
            ->andFilterWhere(['like', 'area.name', $this->area_name]);

        return $dataProvider;
    }
}
