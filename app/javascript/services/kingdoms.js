import apiService from './api';

const kingdomsService = {
  rateKingdom(kingdomId, rating) {
    return apiService.post(`/kingdoms/${kingdomId}/rating`, { rating });
  }
};

export default kingdomsService;
