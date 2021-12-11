class Api::V1::CatalogController < ApplicationController
  def index
    render json: {
      units: Unit.to_api(Unit.all),
      goods: Unit.to_api(Good.all),
      offers: Offer.to_api(Offer.all)
    }, status: 200
  end
end
