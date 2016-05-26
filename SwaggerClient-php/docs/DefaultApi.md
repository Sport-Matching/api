# Swagger\Client\DefaultApi

All URIs are relative to *https://ussouthcentral.services.azureml.net:443/workspaces/2c40c42df0bd4415a35ff34f6ccb1cf9/services/c81476b3a73d4ac79bc0dbe06b52f02b*

Method | HTTP request | Description
------------- | ------------- | -------------
[**canceljob**](DefaultApi.md#canceljob) | **DELETE** /jobs/{jobId}?api-version=2.0 | Cancel a job
[**execute**](DefaultApi.md#execute) | **POST** /execute?api-version=2.0&amp;format=swagger | Execute the web service and get a response synchronously
[**getSwaggerDocument**](DefaultApi.md#getSwaggerDocument) | **GET** /swagger.json | Get swagger API document for the web service
[**getjobstatus**](DefaultApi.md#getjobstatus) | **GET** /jobs/{jobId}?api-version=2.0 | Get the status for a give job
[**startjob**](DefaultApi.md#startjob) | **POST** /jobs/{jobId}/start?api-version=2.0 | Start running a job
[**submitjob**](DefaultApi.md#submitjob) | **POST** /jobs?api-version=2.0 | Submit an asynchronous job to execute the web service


# **canceljob**
> canceljob($job_id)

Cancel a job

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: api_key
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. BEARER) for API key, if needed
// Swagger\Client\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'BEARER');

$api_instance = new Swagger\Client\Api\DefaultApi();
$job_id = "job_id_example"; // string | job id

try { 
    $api_instance->canceljob($job_id);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->canceljob: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **job_id** | **string**| job id | 

### Return type

void (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **execute**
> \Swagger\Client\Model\ExecutionResults execute($body)

Execute the web service and get a response synchronously

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: api_key
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. BEARER) for API key, if needed
// Swagger\Client\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'BEARER');

$api_instance = new Swagger\Client\Api\DefaultApi();
$body = new \Swagger\Client\Model\ExecutionRequest(); // \Swagger\Client\Model\ExecutionRequest | Execution request

try { 
    $result = $api_instance->execute($body);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->execute: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**\Swagger\Client\Model\ExecutionRequest**](\Swagger\Client\Model\ExecutionRequest.md)| Execution request | [optional] 

### Return type

[**\Swagger\Client\Model\ExecutionResults**](ExecutionResults.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSwaggerDocument**
> getSwaggerDocument($api_version)

Get swagger API document for the web service

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

$api_instance = new Swagger\Client\Api\DefaultApi();
$api_version = "2.0"; // string | API version

try { 
    $api_instance->getSwaggerDocument($api_version);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->getSwaggerDocument: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_version** | **string**| API version | [optional] [default to 2.0]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getjobstatus**
> \Swagger\Client\Model\BatchExecutionStatus getjobstatus($job_id)

Get the status for a give job

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: api_key
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. BEARER) for API key, if needed
// Swagger\Client\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'BEARER');

$api_instance = new Swagger\Client\Api\DefaultApi();
$job_id = "job_id_example"; // string | job id

try { 
    $result = $api_instance->getjobstatus($job_id);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->getjobstatus: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **job_id** | **string**| job id | 

### Return type

[**\Swagger\Client\Model\BatchExecutionStatus**](BatchExecutionStatus.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startjob**
> startjob($job_id)

Start running a job

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: api_key
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. BEARER) for API key, if needed
// Swagger\Client\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'BEARER');

$api_instance = new Swagger\Client\Api\DefaultApi();
$job_id = "job_id_example"; // string | job id

try { 
    $api_instance->startjob($job_id);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->startjob: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **job_id** | **string**| job id | 

### Return type

void (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitjob**
> string submitjob($body)

Submit an asynchronous job to execute the web service

### Example 
```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: api_key
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. BEARER) for API key, if needed
// Swagger\Client\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'BEARER');

$api_instance = new Swagger\Client\Api\DefaultApi();
$body = new \Swagger\Client\Model\BatchExecutionRequest(); // \Swagger\Client\Model\BatchExecutionRequest | Batch execution request

try { 
    $result = $api_instance->submitjob($body);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling DefaultApi->submitjob: ', $e->getMessage(), "\n";
}
?>
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**\Swagger\Client\Model\BatchExecutionRequest**](\Swagger\Client\Model\BatchExecutionRequest.md)| Batch execution request | [optional] 

### Return type

**string**

### Authorization

[api_key](../README.md#api_key)

### HTTP reuqest headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

