var restkastenServices = angular.module('restkastenServices', ['ngResource']);

restkastenServices.factory('User',
    function($resource){
        return $resource('/api/users/:userId', {userId:'@id'}, {save: {method: 'PATCH'}, add: {method: 'POST'}});
    }
);

restkastenServices.factory('UserAccessObject',
    function($resource){
        return $resource('/api/users/:userId/access_objects/:objectId', {userId:'@user_id', objectId: '@id'}, {save: {method: 'PATCH'}, add: {method: 'POST'}});
    }
);

restkastenServices.factory('AccessObject',
    function($resource){
        return $resource('/api/access_objects/:objectId', {objectId: '@id'}, {save: {method: 'PATCH'}});
    }
);

restkastenServices.factory('Access',
    function($resource){
        return $resource('/api/users/:userId/accesses/:accessId', {accessId: '@id'}, {save: {method: 'PATCH'}});
    }
);

restkastenServices.factory('AccessObjectAccess',
    function($resource){
        return $resource('/api/access_objects/:objectId/accesses/', {save: {method: 'PATCH'}});
    }
);