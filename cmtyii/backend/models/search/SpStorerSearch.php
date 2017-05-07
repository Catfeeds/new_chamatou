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
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'provinces_id', 'city_id', 'area_id'], 'integer'],
            [['sp_name', 'address', 'add_detail', 'sp_phone', 'cover', 'intro'], 'safe'],
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
            'shoper_id' => $this->shoper_id,
            'lat' => $this->lat,
            'lon' => $this->lon,
            'provinces_id' => $this->provinces_id,
            'city_id' => $this->city_id,
            'area_id' => $this->area_id,
        ]);

        $query->andFilterWhere(['like', 'sp_name', $this->sp_name])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'add_detail', $this->add_detail])
            ->andFilterWhere(['like', 'sp_phone', $this->sp_phone])
            ->andFilterWhere(['like', 'cover', $this->cover])
            ->andFilterWhere(['like', 'intro', $this->intro]);

        return $dataProvider;
    }
}
