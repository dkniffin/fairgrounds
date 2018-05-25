import apiService from './api';

const kingdomsService = {
  upvoteKingdom(kingdomId) {
    return apiService.post(`/kingdoms/${kingdomId}/upvote`);
  }
};

export default kingdomsService;
