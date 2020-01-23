//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSElasticLoadBalancingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSElasticLoadBalancingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSElasticLoadBalancingResources

+ (instancetype)sharedInstance {
    static AWSElasticLoadBalancingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSElasticLoadBalancingResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2012-06-01\",\
    \"endpointPrefix\":\"elasticloadbalancing\",\
    \"protocol\":\"query\",\
    \"serviceFullName\":\"Elastic Load Balancing\",\
    \"serviceId\":\"Elastic Load Balancing\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"elasticloadbalancing-2012-06-01\",\
    \"xmlNamespace\":\"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/\"\
  },\
  \"operations\":{\
    \"AddTags\":{\
      \"name\":\"AddTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTagsInput\"},\
      \"output\":{\
        \"shape\":\"AddTagsOutput\",\
        \"resultWrapper\":\"AddTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"DuplicateTagKeysException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified load balancer. Each load balancer can have a maximum of 10 tags.</p> <p>Each tag consists of a key and an optional value. If a tag with the same key is already associated with the load balancer, <code>AddTags</code> updates its value.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html\\\">Tag Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"ApplySecurityGroupsToLoadBalancer\":{\
      \"name\":\"ApplySecurityGroupsToLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ApplySecurityGroupsToLoadBalancerInput\"},\
      \"output\":{\
        \"shape\":\"ApplySecurityGroupsToLoadBalancerOutput\",\
        \"resultWrapper\":\"ApplySecurityGroupsToLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"InvalidSecurityGroupException\"}\
      ],\
      \"documentation\":\"<p>Associates one or more security groups with your load balancer in a virtual private cloud (VPC). The specified security groups override the previously associated security groups.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups\\\">Security Groups for Load Balancers in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"AttachLoadBalancerToSubnets\":{\
      \"name\":\"AttachLoadBalancerToSubnets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachLoadBalancerToSubnetsInput\"},\
      \"output\":{\
        \"shape\":\"AttachLoadBalancerToSubnetsOutput\",\
        \"resultWrapper\":\"AttachLoadBalancerToSubnetsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"SubnetNotFoundException\"},\
        {\"shape\":\"InvalidSubnetException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more subnets to the set of configured subnets for the specified load balancer.</p> <p>The load balancer evenly distributes requests across all registered subnets. For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html\\\">Add or Remove Subnets for Your Load Balancer in a VPC</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"ConfigureHealthCheck\":{\
      \"name\":\"ConfigureHealthCheck\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfigureHealthCheckInput\"},\
      \"output\":{\
        \"shape\":\"ConfigureHealthCheckOutput\",\
        \"resultWrapper\":\"ConfigureHealthCheckResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Specifies the health check settings to use when evaluating the health state of your EC2 instances.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html\\\">Configure Health Checks for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateAppCookieStickinessPolicy\":{\
      \"name\":\"CreateAppCookieStickinessPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAppCookieStickinessPolicyInput\"},\
      \"output\":{\
        \"shape\":\"CreateAppCookieStickinessPolicyOutput\",\
        \"resultWrapper\":\"CreateAppCookieStickinessPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"DuplicatePolicyNameException\"},\
        {\"shape\":\"TooManyPoliciesException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Generates a stickiness policy with sticky session lifetimes that follow that of an application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.</p> <p>This policy is similar to the policy created by <a>CreateLBCookieStickinessPolicy</a>, except that the lifetime of the special Elastic Load Balancing cookie, <code>AWSELB</code>, follows the lifetime of the application-generated cookie specified in the policy configuration. The load balancer only inserts a new stickiness cookie when the application response includes a new application cookie.</p> <p>If the application cookie is explicitly removed or expires, the session stops being sticky until a new application cookie is issued.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application\\\">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateLBCookieStickinessPolicy\":{\
      \"name\":\"CreateLBCookieStickinessPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLBCookieStickinessPolicyInput\"},\
      \"output\":{\
        \"shape\":\"CreateLBCookieStickinessPolicyOutput\",\
        \"resultWrapper\":\"CreateLBCookieStickinessPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"DuplicatePolicyNameException\"},\
        {\"shape\":\"TooManyPoliciesException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the browser (user-agent) or a specified expiration period. This policy can be associated only with HTTP/HTTPS listeners.</p> <p>When a load balancer implements this policy, the load balancer uses a special cookie to track the instance for each request. When the load balancer receives a request, it first checks to see if this cookie is present in the request. If so, the load balancer sends the request to the application server specified in the cookie. If not, the load balancer sends the request to a server that is chosen based on the existing load-balancing algorithm.</p> <p>A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity of the cookie is based on the cookie expiration time, which is specified in the policy configuration.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration\\\">Duration-Based Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateLoadBalancer\":{\
      \"name\":\"CreateLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAccessPointInput\"},\
      \"output\":{\
        \"shape\":\"CreateAccessPointOutput\",\
        \"resultWrapper\":\"CreateLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DuplicateAccessPointNameException\"},\
        {\"shape\":\"TooManyAccessPointsException\"},\
        {\"shape\":\"CertificateNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"SubnetNotFoundException\"},\
        {\"shape\":\"InvalidSubnetException\"},\
        {\"shape\":\"InvalidSecurityGroupException\"},\
        {\"shape\":\"InvalidSchemeException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"DuplicateTagKeysException\"},\
        {\"shape\":\"UnsupportedProtocolException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Creates a Classic Load Balancer.</p> <p>You can add listeners, security groups, subnets, and tags when you create your load balancer, or you can add them later using <a>CreateLoadBalancerListeners</a>, <a>ApplySecurityGroupsToLoadBalancer</a>, <a>AttachLoadBalancerToSubnets</a>, and <a>AddTags</a>.</p> <p>To describe your current load balancers, see <a>DescribeLoadBalancers</a>. When you are finished with a load balancer, you can delete it using <a>DeleteLoadBalancer</a>.</p> <p>You can create up to 20 load balancers per region per account. You can request an increase for the number of load balancers for your account. For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html\\\">Limits for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateLoadBalancerListeners\":{\
      \"name\":\"CreateLoadBalancerListeners\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLoadBalancerListenerInput\"},\
      \"output\":{\
        \"shape\":\"CreateLoadBalancerListenerOutput\",\
        \"resultWrapper\":\"CreateLoadBalancerListenersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"DuplicateListenerException\"},\
        {\"shape\":\"CertificateNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"UnsupportedProtocolException\"}\
      ],\
      \"documentation\":\"<p>Creates one or more listeners for the specified load balancer. If a listener with the specified port does not already exist, it is created; otherwise, the properties of the new listener must match the properties of the existing listener.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html\\\">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"CreateLoadBalancerPolicy\":{\
      \"name\":\"CreateLoadBalancerPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLoadBalancerPolicyInput\"},\
      \"output\":{\
        \"shape\":\"CreateLoadBalancerPolicyOutput\",\
        \"resultWrapper\":\"CreateLoadBalancerPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"PolicyTypeNotFoundException\"},\
        {\"shape\":\"DuplicatePolicyNameException\"},\
        {\"shape\":\"TooManyPoliciesException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Creates a policy with the specified attributes for the specified load balancer.</p> <p>Policies are settings that are saved for your load balancer and that can be applied to the listener or the application server, depending on the policy type.</p>\"\
    },\
    \"DeleteLoadBalancer\":{\
      \"name\":\"DeleteLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAccessPointInput\"},\
      \"output\":{\
        \"shape\":\"DeleteAccessPointOutput\",\
        \"resultWrapper\":\"DeleteLoadBalancerResult\"\
      },\
      \"documentation\":\"<p>Deletes the specified load balancer.</p> <p>If you are attempting to recreate a load balancer, you must reconfigure all settings. The DNS name associated with a deleted load balancer are no longer usable. The name and associated DNS record of the deleted load balancer no longer exist and traffic sent to any of its IP addresses is no longer delivered to your instances.</p> <p>If the load balancer does not exist or has already been deleted, the call to <code>DeleteLoadBalancer</code> still succeeds.</p>\"\
    },\
    \"DeleteLoadBalancerListeners\":{\
      \"name\":\"DeleteLoadBalancerListeners\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLoadBalancerListenerInput\"},\
      \"output\":{\
        \"shape\":\"DeleteLoadBalancerListenerOutput\",\
        \"resultWrapper\":\"DeleteLoadBalancerListenersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified listeners from the specified load balancer.</p>\"\
    },\
    \"DeleteLoadBalancerPolicy\":{\
      \"name\":\"DeleteLoadBalancerPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLoadBalancerPolicyInput\"},\
      \"output\":{\
        \"shape\":\"DeleteLoadBalancerPolicyOutput\",\
        \"resultWrapper\":\"DeleteLoadBalancerPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified policy from the specified load balancer. This policy must not be enabled for any listeners.</p>\"\
    },\
    \"DeregisterInstancesFromLoadBalancer\":{\
      \"name\":\"DeregisterInstancesFromLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeregisterEndPointsInput\"},\
      \"output\":{\
        \"shape\":\"DeregisterEndPointsOutput\",\
        \"resultWrapper\":\"DeregisterInstancesFromLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidEndPointException\"}\
      ],\
      \"documentation\":\"<p>Deregisters the specified instances from the specified load balancer. After the instance is deregistered, it no longer receives traffic from the load balancer.</p> <p>You can use <a>DescribeLoadBalancers</a> to verify that the instance is deregistered from the load balancer.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html\\\">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"DescribeAccountLimits\":{\
      \"name\":\"DescribeAccountLimits\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountLimitsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAccountLimitsOutput\",\
        \"resultWrapper\":\"DescribeAccountLimitsResult\"\
      },\
      \"documentation\":\"<p>Describes the current Elastic Load Balancing resource limits for your AWS account.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html\\\">Limits for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"DescribeInstanceHealth\":{\
      \"name\":\"DescribeInstanceHealth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEndPointStateInput\"},\
      \"output\":{\
        \"shape\":\"DescribeEndPointStateOutput\",\
        \"resultWrapper\":\"DescribeInstanceHealthResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidEndPointException\"}\
      ],\
      \"documentation\":\"<p>Describes the state of the specified instances with respect to the specified load balancer. If no instances are specified, the call describes the state of all instances that are currently registered with the load balancer. If instances are specified, their state is returned even if they are no longer registered with the load balancer. The state of terminated instances is not returned.</p>\"\
    },\
    \"DescribeLoadBalancerAttributes\":{\
      \"name\":\"DescribeLoadBalancerAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancerAttributesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancerAttributesOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancerAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"LoadBalancerAttributeNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the attributes for the specified load balancer.</p>\"\
    },\
    \"DescribeLoadBalancerPolicies\":{\
      \"name\":\"DescribeLoadBalancerPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancerPoliciesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancerPoliciesOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancerPoliciesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"PolicyNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified policies.</p> <p>If you specify a load balancer name, the action returns the descriptions of all policies created for the load balancer. If you specify a policy name associated with your load balancer, the action returns the description of that policy. If you don't specify a load balancer name, the action returns descriptions of the specified sample policies, or descriptions of all sample policies. The names of the sample policies have the <code>ELBSample-</code> prefix.</p>\"\
    },\
    \"DescribeLoadBalancerPolicyTypes\":{\
      \"name\":\"DescribeLoadBalancerPolicyTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancerPolicyTypesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancerPolicyTypesOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancerPolicyTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"PolicyTypeNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified load balancer policy types or all load balancer policy types.</p> <p>The description of each type indicates how it can be used. For example, some policies can be used only with layer 7 listeners, some policies can be used only with layer 4 listeners, and some policies can be used only with your EC2 instances.</p> <p>You can use <a>CreateLoadBalancerPolicy</a> to create a policy configuration for any of these policy types. Then, depending on the policy type, use either <a>SetLoadBalancerPoliciesOfListener</a> or <a>SetLoadBalancerPoliciesForBackendServer</a> to set the policy.</p>\"\
    },\
    \"DescribeLoadBalancers\":{\
      \"name\":\"DescribeLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccessPointsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAccessPointsOutput\",\
        \"resultWrapper\":\"DescribeLoadBalancersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"DependencyThrottleException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified the load balancers. If no load balancers are specified, the call describes all of your load balancers.</p>\"\
    },\
    \"DescribeTags\":{\
      \"name\":\"DescribeTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTagsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTagsOutput\",\
        \"resultWrapper\":\"DescribeTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the tags associated with the specified load balancers.</p>\"\
    },\
    \"DetachLoadBalancerFromSubnets\":{\
      \"name\":\"DetachLoadBalancerFromSubnets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachLoadBalancerFromSubnetsInput\"},\
      \"output\":{\
        \"shape\":\"DetachLoadBalancerFromSubnetsOutput\",\
        \"resultWrapper\":\"DetachLoadBalancerFromSubnetsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified subnets from the set of configured subnets for the load balancer.</p> <p>After a subnet is removed, all EC2 instances registered with the load balancer in the removed subnet go into the <code>OutOfService</code> state. Then, the load balancer balances the traffic among the remaining routable subnets.</p>\"\
    },\
    \"DisableAvailabilityZonesForLoadBalancer\":{\
      \"name\":\"DisableAvailabilityZonesForLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveAvailabilityZonesInput\"},\
      \"output\":{\
        \"shape\":\"RemoveAvailabilityZonesOutput\",\
        \"resultWrapper\":\"DisableAvailabilityZonesForLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified Availability Zones from the set of Availability Zones for the specified load balancer in EC2-Classic or a default VPC.</p> <p>For load balancers in a non-default VPC, use <a>DetachLoadBalancerFromSubnets</a>.</p> <p>There must be at least one Availability Zone registered with a load balancer at all times. After an Availability Zone is removed, all instances registered with the load balancer that are in the removed Availability Zone go into the <code>OutOfService</code> state. Then, the load balancer attempts to equally balance the traffic among its remaining Availability Zones.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html\\\">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"EnableAvailabilityZonesForLoadBalancer\":{\
      \"name\":\"EnableAvailabilityZonesForLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddAvailabilityZonesInput\"},\
      \"output\":{\
        \"shape\":\"AddAvailabilityZonesOutput\",\
        \"resultWrapper\":\"EnableAvailabilityZonesForLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified Availability Zones to the set of Availability Zones for the specified load balancer in EC2-Classic or a default VPC.</p> <p>For load balancers in a non-default VPC, use <a>AttachLoadBalancerToSubnets</a>.</p> <p>The load balancer evenly distributes requests across all its registered Availability Zones that contain instances. For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html\\\">Add or Remove Availability Zones</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"ModifyLoadBalancerAttributes\":{\
      \"name\":\"ModifyLoadBalancerAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyLoadBalancerAttributesInput\"},\
      \"output\":{\
        \"shape\":\"ModifyLoadBalancerAttributesOutput\",\
        \"resultWrapper\":\"ModifyLoadBalancerAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"LoadBalancerAttributeNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the attributes of the specified load balancer.</p> <p>You can modify the load balancer attributes, such as <code>AccessLogs</code>, <code>ConnectionDraining</code>, and <code>CrossZoneLoadBalancing</code> by either enabling or disabling them. Or, you can modify the load balancer attribute <code>ConnectionSettings</code> by specifying an idle connection timeout value for your load balancer.</p> <p>For more information, see the following in the <i>Classic Load Balancers Guide</i>:</p> <ul> <li> <p> <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html\\\">Cross-Zone Load Balancing</a> </p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html\\\">Connection Draining</a> </p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html\\\">Access Logs</a> </p> </li> <li> <p> <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html\\\">Idle Connection Timeout</a> </p> </li> </ul>\"\
    },\
    \"RegisterInstancesWithLoadBalancer\":{\
      \"name\":\"RegisterInstancesWithLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterEndPointsInput\"},\
      \"output\":{\
        \"shape\":\"RegisterEndPointsOutput\",\
        \"resultWrapper\":\"RegisterInstancesWithLoadBalancerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"InvalidEndPointException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified instances to the specified load balancer.</p> <p>The instance must be a running instance in the same network as the load balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances and a load balancer in a VPC with ClassicLink enabled, you can link the EC2-Classic instances to that VPC and then register the linked EC2-Classic instances with the load balancer in the VPC.</p> <p>Note that <code>RegisterInstanceWithLoadBalancer</code> completes when the request has been registered. Instance registration takes a little time to complete. To check the state of the registered instances, use <a>DescribeLoadBalancers</a> or <a>DescribeInstanceHealth</a>.</p> <p>After the instance is registered, it starts receiving traffic and requests from the load balancer. Any instance that is not in one of the Availability Zones registered for the load balancer is moved to the <code>OutOfService</code> state. If an Availability Zone is added to the load balancer later, any instances registered with the load balancer move to the <code>InService</code> state.</p> <p>To deregister instances from a load balancer, use <a>DeregisterInstancesFromLoadBalancer</a>.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html\\\">Register or De-Register EC2 Instances</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"RemoveTags\":{\
      \"name\":\"RemoveTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveTagsInput\"},\
      \"output\":{\
        \"shape\":\"RemoveTagsOutput\",\
        \"resultWrapper\":\"RemoveTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified load balancer.</p>\"\
    },\
    \"SetLoadBalancerListenerSSLCertificate\":{\
      \"name\":\"SetLoadBalancerListenerSSLCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetLoadBalancerListenerSSLCertificateInput\"},\
      \"output\":{\
        \"shape\":\"SetLoadBalancerListenerSSLCertificateOutput\",\
        \"resultWrapper\":\"SetLoadBalancerListenerSSLCertificateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CertificateNotFoundException\"},\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"},\
        {\"shape\":\"UnsupportedProtocolException\"}\
      ],\
      \"documentation\":\"<p>Sets the certificate that terminates the specified listener's SSL connections. The specified certificate replaces any prior certificate that was used on the same load balancer and port.</p> <p>For more information about updating your SSL certificate, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html\\\">Replace the SSL Certificate for Your Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"SetLoadBalancerPoliciesForBackendServer\":{\
      \"name\":\"SetLoadBalancerPoliciesForBackendServer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetLoadBalancerPoliciesForBackendServerInput\"},\
      \"output\":{\
        \"shape\":\"SetLoadBalancerPoliciesForBackendServerOutput\",\
        \"resultWrapper\":\"SetLoadBalancerPoliciesForBackendServerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"PolicyNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Replaces the set of policies associated with the specified port on which the EC2 instance is listening with a new set of policies. At this time, only the back-end server authentication policy type can be applied to the instance ports; this policy type is composed of multiple public key policies.</p> <p>Each time you use <code>SetLoadBalancerPoliciesForBackendServer</code> to enable the policies, use the <code>PolicyNames</code> parameter to list the policies that you want to enable.</p> <p>You can use <a>DescribeLoadBalancers</a> or <a>DescribeLoadBalancerPolicies</a> to verify that the policy is associated with the EC2 instance.</p> <p>For more information about enabling back-end instance authentication, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt\\\">Configure Back-end Instance Authentication</a> in the <i>Classic Load Balancers Guide</i>. For more information about Proxy Protocol, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html\\\">Configure Proxy Protocol Support</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"SetLoadBalancerPoliciesOfListener\":{\
      \"name\":\"SetLoadBalancerPoliciesOfListener\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetLoadBalancerPoliciesOfListenerInput\"},\
      \"output\":{\
        \"shape\":\"SetLoadBalancerPoliciesOfListenerOutput\",\
        \"resultWrapper\":\"SetLoadBalancerPoliciesOfListenerResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AccessPointNotFoundException\"},\
        {\"shape\":\"PolicyNotFoundException\"},\
        {\"shape\":\"ListenerNotFoundException\"},\
        {\"shape\":\"InvalidConfigurationRequestException\"}\
      ],\
      \"documentation\":\"<p>Replaces the current set of policies for the specified load balancer port with the specified set of policies.</p> <p>To enable back-end server authentication, use <a>SetLoadBalancerPoliciesForBackendServer</a>.</p> <p>For more information about setting policies, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html\\\">Update the SSL Negotiation Configuration</a>, <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration\\\">Duration-Based Session Stickiness</a>, and <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application\\\">Application-Controlled Session Stickiness</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessLog\":{\
      \"type\":\"structure\",\
      \"required\":[\"Enabled\"],\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"AccessLogEnabled\",\
          \"documentation\":\"<p>Specifies whether access logs are enabled for the load balancer.</p>\"\
        },\
        \"S3BucketName\":{\
          \"shape\":\"S3BucketName\",\
          \"documentation\":\"<p>The name of the Amazon S3 bucket where the access logs are stored.</p>\"\
        },\
        \"EmitInterval\":{\
          \"shape\":\"AccessLogInterval\",\
          \"documentation\":\"<p>The interval for publishing the access logs. You can specify an interval of either 5 minutes or 60 minutes.</p> <p>Default: 60 minutes</p>\"\
        },\
        \"S3BucketPrefix\":{\
          \"shape\":\"AccessLogPrefix\",\
          \"documentation\":\"<p>The logical hierarchy you created for your Amazon S3 bucket, for example <code>my-bucket-prefix/prod</code>. If the prefix is not provided, the log is placed at the root level of the bucket.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the <code>AccessLog</code> attribute.</p>\"\
    },\
    \"AccessLogEnabled\":{\"type\":\"boolean\"},\
    \"AccessLogInterval\":{\"type\":\"integer\"},\
    \"AccessLogPrefix\":{\"type\":\"string\"},\
    \"AccessPointName\":{\"type\":\"string\"},\
    \"AccessPointNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified load balancer does not exist.</p>\",\
      \"error\":{\
        \"code\":\"LoadBalancerNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AccessPointPort\":{\"type\":\"integer\"},\
    \"AddAvailabilityZonesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"AvailabilityZones\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The Availability Zones. These must be in the same region as the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for EnableAvailabilityZonesForLoadBalancer.</p>\"\
    },\
    \"AddAvailabilityZonesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The updated list of Availability Zones for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of EnableAvailabilityZonesForLoadBalancer.</p>\"\
    },\
    \"AddTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerNames\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The name of the load balancer. You can specify one load balancer only.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AddTags.</p>\"\
    },\
    \"AddTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of AddTags.</p>\"\
    },\
    \"AdditionalAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"AdditionalAttributeKey\",\
          \"documentation\":\"<p>This parameter is reserved.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"AdditionalAttributeValue\",\
          \"documentation\":\"<p>This parameter is reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This data type is reserved.</p>\"\
    },\
    \"AdditionalAttributeKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^[a-zA-Z0-9.]+$\"\
    },\
    \"AdditionalAttributeValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^[a-zA-Z0-9.]+$\"\
    },\
    \"AdditionalAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AdditionalAttribute\"},\
      \"max\":10\
    },\
    \"AppCookieStickinessPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppCookieStickinessPolicy\"}\
    },\
    \"AppCookieStickinessPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The mnemonic name for the policy being created. The name must be unique within a set of policies for this load balancer.</p>\"\
        },\
        \"CookieName\":{\
          \"shape\":\"CookieName\",\
          \"documentation\":\"<p>The name of the application cookie used for stickiness.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy for application-controlled session stickiness.</p>\"\
    },\
    \"ApplySecurityGroupsToLoadBalancerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"SecurityGroups\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups to associate with the load balancer. Note that you cannot specify the name of the security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ApplySecurityGroupsToLoadBalancer.</p>\"\
    },\
    \"ApplySecurityGroupsToLoadBalancerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups associated with the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ApplySecurityGroupsToLoadBalancer.</p>\"\
    },\
    \"AttachLoadBalancerToSubnetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Subnets\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets to add. You can add only one subnet per Availability Zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachLoaBalancerToSubnets.</p>\"\
    },\
    \"AttachLoadBalancerToSubnetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets attached to the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AttachLoadBalancerToSubnets.</p>\"\
    },\
    \"AttributeName\":{\"type\":\"string\"},\
    \"AttributeType\":{\"type\":\"string\"},\
    \"AttributeValue\":{\"type\":\"string\"},\
    \"AvailabilityZone\":{\"type\":\"string\"},\
    \"AvailabilityZones\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailabilityZone\"}\
    },\
    \"BackendServerDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstancePort\":{\
          \"shape\":\"InstancePort\",\
          \"documentation\":\"<p>The port on which the EC2 instance is listening.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The names of the policies enabled for the EC2 instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the configuration of an EC2 instance.</p>\"\
    },\
    \"BackendServerDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackendServerDescription\"}\
    },\
    \"Cardinality\":{\"type\":\"string\"},\
    \"CertificateNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified ARN does not refer to a valid SSL certificate in AWS Identity and Access Management (IAM) or AWS Certificate Manager (ACM). Note that if you recently uploaded the certificate to IAM, this error might indicate that the certificate is not fully available yet.</p>\",\
      \"error\":{\
        \"code\":\"CertificateNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ConfigureHealthCheckInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"HealthCheck\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>The configuration information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ConfigureHealthCheck.</p>\"\
    },\
    \"ConfigureHealthCheckOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>The updated health check.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ConfigureHealthCheck.</p>\"\
    },\
    \"ConnectionDraining\":{\
      \"type\":\"structure\",\
      \"required\":[\"Enabled\"],\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"ConnectionDrainingEnabled\",\
          \"documentation\":\"<p>Specifies whether connection draining is enabled for the load balancer.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"ConnectionDrainingTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, to keep the existing connections open before deregistering the instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the <code>ConnectionDraining</code> attribute.</p>\"\
    },\
    \"ConnectionDrainingEnabled\":{\"type\":\"boolean\"},\
    \"ConnectionDrainingTimeout\":{\"type\":\"integer\"},\
    \"ConnectionSettings\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdleTimeout\"],\
      \"members\":{\
        \"IdleTimeout\":{\
          \"shape\":\"IdleTimeout\",\
          \"documentation\":\"<p>The time, in seconds, that the connection is allowed to be idle (no data has been sent over the connection) before it is closed by the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the <code>ConnectionSettings</code> attribute.</p>\"\
    },\
    \"CookieExpirationPeriod\":{\"type\":\"long\"},\
    \"CookieName\":{\"type\":\"string\"},\
    \"CreateAccessPointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Listeners\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p> <p>This name must be unique within your set of load balancers for the region, must have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and cannot begin or end with a hyphen.</p>\"\
        },\
        \"Listeners\":{\
          \"shape\":\"Listeners\",\
          \"documentation\":\"<p>The listeners.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html\\\">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>One or more Availability Zones from the same region as the load balancer.</p> <p>You must specify at least one Availability Zone.</p> <p>You can add more Availability Zones after you create the load balancer using <a>EnableAvailabilityZonesForLoadBalancer</a>.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets in your VPC to attach to the load balancer. Specify one subnet per Availability Zone specified in <code>AvailabilityZones</code>.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups to assign to the load balancer.</p>\"\
        },\
        \"Scheme\":{\
          \"shape\":\"LoadBalancerScheme\",\
          \"documentation\":\"<p>The type of a load balancer. Valid only for load balancers in a VPC.</p> <p>By default, Elastic Load Balancing creates an Internet-facing load balancer with a DNS name that resolves to public IP addresses. For more information about Internet-facing and Internal load balancers, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#load-balancer-scheme\\\">Load Balancer Scheme</a> in the <i>Elastic Load Balancing User Guide</i>.</p> <p>Specify <code>internal</code> to create a load balancer with a DNS name that resolves to private IP addresses.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to assign to the load balancer.</p> <p>For more information about tagging your load balancer, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html\\\">Tag Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateLoadBalancer.</p>\"\
    },\
    \"CreateAccessPointOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The DNS name of the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for CreateLoadBalancer.</p>\"\
    },\
    \"CreateAppCookieStickinessPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"PolicyName\",\
        \"CookieName\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy being created. Policy names must consist of alphanumeric characters and dashes (-). This name must be unique within the set of policies for this load balancer.</p>\"\
        },\
        \"CookieName\":{\
          \"shape\":\"CookieName\",\
          \"documentation\":\"<p>The name of the application cookie used for stickiness.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateAppCookieStickinessPolicy.</p>\"\
    },\
    \"CreateAppCookieStickinessPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output for CreateAppCookieStickinessPolicy.</p>\"\
    },\
    \"CreateLBCookieStickinessPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy being created. Policy names must consist of alphanumeric characters and dashes (-). This name must be unique within the set of policies for this load balancer.</p>\"\
        },\
        \"CookieExpirationPeriod\":{\
          \"shape\":\"CookieExpirationPeriod\",\
          \"documentation\":\"<p>The time period, in seconds, after which the cookie should be considered stale. If you do not specify this parameter, the default value is 0, which indicates that the sticky session should last for the duration of the browser session.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateLBCookieStickinessPolicy.</p>\"\
    },\
    \"CreateLBCookieStickinessPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output for CreateLBCookieStickinessPolicy.</p>\"\
    },\
    \"CreateLoadBalancerListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Listeners\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Listeners\":{\
          \"shape\":\"Listeners\",\
          \"documentation\":\"<p>The listeners.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateLoadBalancerListeners.</p>\"\
    },\
    \"CreateLoadBalancerListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateLoadBalancerListener.</p>\"\
    },\
    \"CreateLoadBalancerPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"PolicyName\",\
        \"PolicyTypeName\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the load balancer policy to be created. This name must be unique within the set of policies for this load balancer.</p>\"\
        },\
        \"PolicyTypeName\":{\
          \"shape\":\"PolicyTypeName\",\
          \"documentation\":\"<p>The name of the base policy type. To get the list of policy types, use <a>DescribeLoadBalancerPolicyTypes</a>.</p>\"\
        },\
        \"PolicyAttributes\":{\
          \"shape\":\"PolicyAttributes\",\
          \"documentation\":\"<p>The policy attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateLoadBalancerPolicy.</p>\"\
    },\
    \"CreateLoadBalancerPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of CreateLoadBalancerPolicy.</p>\"\
    },\
    \"CreatedTime\":{\"type\":\"timestamp\"},\
    \"CrossZoneLoadBalancing\":{\
      \"type\":\"structure\",\
      \"required\":[\"Enabled\"],\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"CrossZoneLoadBalancingEnabled\",\
          \"documentation\":\"<p>Specifies whether cross-zone load balancing is enabled for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the <code>CrossZoneLoadBalancing</code> attribute.</p>\"\
    },\
    \"CrossZoneLoadBalancingEnabled\":{\"type\":\"boolean\"},\
    \"DNSName\":{\"type\":\"string\"},\
    \"DefaultValue\":{\"type\":\"string\"},\
    \"DeleteAccessPointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerName\"],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteLoadBalancer.</p>\"\
    },\
    \"DeleteAccessPointOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of DeleteLoadBalancer.</p>\"\
    },\
    \"DeleteLoadBalancerListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"LoadBalancerPorts\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"LoadBalancerPorts\":{\
          \"shape\":\"Ports\",\
          \"documentation\":\"<p>The client port numbers of the listeners.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteLoadBalancerListeners.</p>\"\
    },\
    \"DeleteLoadBalancerListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of DeleteLoadBalancerListeners.</p>\"\
    },\
    \"DeleteLoadBalancerPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteLoadBalancerPolicy.</p>\"\
    },\
    \"DeleteLoadBalancerPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of DeleteLoadBalancerPolicy.</p>\"\
    },\
    \"DependencyThrottleException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A request made by Elastic Load Balancing to another service exceeds the maximum request rate permitted for your account.</p>\",\
      \"error\":{\
        \"code\":\"DependencyThrottle\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DeregisterEndPointsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Instances\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The IDs of the instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeregisterInstancesFromLoadBalancer.</p>\"\
    },\
    \"DeregisterEndPointsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The remaining instances registered with the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DeregisterInstancesFromLoadBalancer.</p>\"\
    },\
    \"DescribeAccessPointsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The names of the load balancers.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call (a number from 1 to 400). The default is 400.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeLoadBalancers.</p>\"\
    },\
    \"DescribeAccessPointsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerDescriptions\":{\
          \"shape\":\"LoadBalancerDescriptions\",\
          \"documentation\":\"<p>Information about the load balancers.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker to use when requesting the next set of results. If there are no additional results, the string is empty.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeLoadBalancers.</p>\"\
    },\
    \"DescribeAccountLimitsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results. (You received this marker from a previous call.)</p>\"\
        },\
        \"PageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return with this call.</p>\"\
        }\
      }\
    },\
    \"DescribeAccountLimitsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limits\":{\
          \"shape\":\"Limits\",\
          \"documentation\":\"<p>Information about the limits.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker to use when requesting the next set of results. If there are no additional results, the string is empty.</p>\"\
        }\
      }\
    },\
    \"DescribeEndPointStateInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerName\"],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The IDs of the instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeInstanceHealth.</p>\"\
    },\
    \"DescribeEndPointStateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceStates\":{\
          \"shape\":\"InstanceStates\",\
          \"documentation\":\"<p>Information about the health of the instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeInstanceHealth.</p>\"\
    },\
    \"DescribeLoadBalancerAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerName\"],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeLoadBalancerAttributes.</p>\"\
    },\
    \"DescribeLoadBalancerAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerAttributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>Information about the load balancer attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeLoadBalancerAttributes.</p>\"\
    },\
    \"DescribeLoadBalancerPoliciesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The names of the policies.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeLoadBalancerPolicies.</p>\"\
    },\
    \"DescribeLoadBalancerPoliciesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyDescriptions\":{\
          \"shape\":\"PolicyDescriptions\",\
          \"documentation\":\"<p>Information about the policies.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeLoadBalancerPolicies.</p>\"\
    },\
    \"DescribeLoadBalancerPolicyTypesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyTypeNames\":{\
          \"shape\":\"PolicyTypeNames\",\
          \"documentation\":\"<p>The names of the policy types. If no names are specified, describes all policy types defined by Elastic Load Balancing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeLoadBalancerPolicyTypes.</p>\"\
    },\
    \"DescribeLoadBalancerPolicyTypesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyTypeDescriptions\":{\
          \"shape\":\"PolicyTypeDescriptions\",\
          \"documentation\":\"<p>Information about the policy types.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeLoadBalancerPolicyTypes.</p>\"\
    },\
    \"DescribeTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"LoadBalancerNames\"],\
      \"members\":{\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNamesMax20\",\
          \"documentation\":\"<p>The names of the load balancers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeTags.</p>\"\
    },\
    \"DescribeTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagDescriptions\":{\
          \"shape\":\"TagDescriptions\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeTags.</p>\"\
    },\
    \"Description\":{\"type\":\"string\"},\
    \"DetachLoadBalancerFromSubnetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Subnets\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachLoadBalancerFromSubnets.</p>\"\
    },\
    \"DetachLoadBalancerFromSubnetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the remaining subnets for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DetachLoadBalancerFromSubnets.</p>\"\
    },\
    \"DuplicateAccessPointNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified load balancer name already exists for this account.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateLoadBalancerName\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateListenerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A listener already exists for the specified load balancer name and port, but with a different instance port, protocol, or SSL certificate.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateListener\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicatePolicyNameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A policy with the specified name already exists for this load balancer.</p>\",\
      \"error\":{\
        \"code\":\"DuplicatePolicyName\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DuplicateTagKeysException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A tag key was specified more than once.</p>\",\
      \"error\":{\
        \"code\":\"DuplicateTagKeys\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"EndPointPort\":{\"type\":\"integer\"},\
    \"HealthCheck\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Target\",\
        \"Interval\",\
        \"Timeout\",\
        \"UnhealthyThreshold\",\
        \"HealthyThreshold\"\
      ],\
      \"members\":{\
        \"Target\":{\
          \"shape\":\"HealthCheckTarget\",\
          \"documentation\":\"<p>The instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL. The range of valid ports is one (1) through 65535.</p> <p>TCP is the default, specified as a TCP: port pair, for example \\\"TCP:5000\\\". In this case, a health check simply attempts to open a TCP connection to the instance on the specified port. Failure to connect within the configured timeout is considered unhealthy.</p> <p>SSL is also specified as SSL: port pair, for example, SSL:5000.</p> <p>For HTTP/HTTPS, you must include a ping path in the string. HTTP is specified as a HTTP:port;/;PathToPing; grouping, for example \\\"HTTP:80/weather/us/wa/seattle\\\". In this case, a HTTP GET request is issued to the instance on the given port and path. Any answer other than \\\"200 OK\\\" within the timeout period is considered unhealthy.</p> <p>The total length of the HTTP ping target must be 1024 16-bit Unicode characters or less.</p>\"\
        },\
        \"Interval\":{\
          \"shape\":\"HealthCheckInterval\",\
          \"documentation\":\"<p>The approximate interval, in seconds, between health checks of an individual instance.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"HealthCheckTimeout\",\
          \"documentation\":\"<p>The amount of time, in seconds, during which no response means a failed health check.</p> <p>This value must be less than the <code>Interval</code> value.</p>\"\
        },\
        \"UnhealthyThreshold\":{\
          \"shape\":\"UnhealthyThreshold\",\
          \"documentation\":\"<p>The number of consecutive health check failures required before moving the instance to the <code>Unhealthy</code> state.</p>\"\
        },\
        \"HealthyThreshold\":{\
          \"shape\":\"HealthyThreshold\",\
          \"documentation\":\"<p>The number of consecutive health checks successes required before moving the instance to the <code>Healthy</code> state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a health check.</p>\"\
    },\
    \"HealthCheckInterval\":{\
      \"type\":\"integer\",\
      \"max\":300,\
      \"min\":5\
    },\
    \"HealthCheckTarget\":{\"type\":\"string\"},\
    \"HealthCheckTimeout\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":2\
    },\
    \"HealthyThreshold\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"IdleTimeout\":{\
      \"type\":\"integer\",\
      \"max\":3600,\
      \"min\":1\
    },\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The instance ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ID of an EC2 instance.</p>\"\
    },\
    \"InstanceId\":{\"type\":\"string\"},\
    \"InstancePort\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":1\
    },\
    \"InstanceState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"State\",\
          \"documentation\":\"<p>The current state of the instance.</p> <p>Valid values: <code>InService</code> | <code>OutOfService</code> | <code>Unknown</code> </p>\"\
        },\
        \"ReasonCode\":{\
          \"shape\":\"ReasonCode\",\
          \"documentation\":\"<p>Information about the cause of <code>OutOfService</code> instances. Specifically, whether the cause is Elastic Load Balancing or the instance.</p> <p>Valid values: <code>ELB</code> | <code>Instance</code> | <code>N/A</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the instance state. This string can contain one or more of the following messages.</p> <ul> <li> <p> <code>N/A</code> </p> </li> <li> <p> <code>A transient error occurred. Please try again later.</code> </p> </li> <li> <p> <code>Instance has failed at least the UnhealthyThreshold number of health checks consecutively.</code> </p> </li> <li> <p> <code>Instance has not passed the configured HealthyThreshold number of health checks consecutively.</code> </p> </li> <li> <p> <code>Instance registration is still in progress.</code> </p> </li> <li> <p> <code>Instance is in the EC2 Availability Zone for which LoadBalancer is not configured to route traffic to.</code> </p> </li> <li> <p> <code>Instance is not currently registered with the LoadBalancer.</code> </p> </li> <li> <p> <code>Instance deregistration currently in progress.</code> </p> </li> <li> <p> <code>Disable Availability Zone is currently in progress.</code> </p> </li> <li> <p> <code>Instance is in pending state.</code> </p> </li> <li> <p> <code>Instance is in stopped state.</code> </p> </li> <li> <p> <code>Instance is in terminated state.</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the state of an EC2 instance.</p>\"\
    },\
    \"InstanceStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceState\"}\
    },\
    \"Instances\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Instance\"}\
    },\
    \"InvalidConfigurationRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested configuration change is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidConfigurationRequest\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidEndPointException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified endpoint is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidInstance\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSchemeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified value for the schema is not valid. You can only specify a scheme for load balancers in a VPC.</p>\",\
      \"error\":{\
        \"code\":\"InvalidScheme\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSecurityGroupException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>One or more of the specified security groups do not exist.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSecurityGroup\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSubnetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified VPC has no associated Internet gateway.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSubnet\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LBCookieStickinessPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LBCookieStickinessPolicy\"}\
    },\
    \"LBCookieStickinessPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy. This name must be unique within the set of policies for this load balancer.</p>\"\
        },\
        \"CookieExpirationPeriod\":{\
          \"shape\":\"CookieExpirationPeriod\",\
          \"documentation\":\"<p>The time period, in seconds, after which the cookie should be considered stale. If this parameter is not specified, the stickiness session lasts for the duration of the browser session.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy for duration-based session stickiness.</p>\"\
    },\
    \"Limit\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the limit. The possible values are:</p> <ul> <li> <p>classic-listeners</p> </li> <li> <p>classic-load-balancers</p> </li> <li> <p>classic-registered-instances</p> </li> </ul>\"\
        },\
        \"Max\":{\
          \"shape\":\"Max\",\
          \"documentation\":\"<p>The maximum value of the limit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an Elastic Load Balancing resource limit for your AWS account.</p>\"\
    },\
    \"Limits\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Limit\"}\
    },\
    \"Listener\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Protocol\",\
        \"LoadBalancerPort\",\
        \"InstancePort\"\
      ],\
      \"members\":{\
        \"Protocol\":{\
          \"shape\":\"Protocol\",\
          \"documentation\":\"<p>The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP, or SSL.</p>\"\
        },\
        \"LoadBalancerPort\":{\
          \"shape\":\"AccessPointPort\",\
          \"documentation\":\"<p>The port on which the load balancer is listening. On EC2-VPC, you can specify any port from the range 1-65535. On EC2-Classic, you can specify any port from the following list: 25, 80, 443, 465, 587, 1024-65535.</p>\"\
        },\
        \"InstanceProtocol\":{\
          \"shape\":\"Protocol\",\
          \"documentation\":\"<p>The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or SSL.</p> <p>If the front-end protocol is HTTP, HTTPS, TCP, or SSL, <code>InstanceProtocol</code> must be at the same protocol.</p> <p>If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is secure, (HTTPS or SSL), the listener's <code>InstanceProtocol</code> must also be secure.</p> <p>If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is HTTP or TCP, the listener's <code>InstanceProtocol</code> must be HTTP or TCP.</p>\"\
        },\
        \"InstancePort\":{\
          \"shape\":\"InstancePort\",\
          \"documentation\":\"<p>The port on which the instance is listening.</p>\"\
        },\
        \"SSLCertificateId\":{\
          \"shape\":\"SSLCertificateId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the server certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a listener.</p> <p>For information about the protocols and the ports supported by Elastic Load Balancing, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html\\\">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
    },\
    \"ListenerDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Listener\":{\
          \"shape\":\"Listener\",\
          \"documentation\":\"<p>The listener.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The policies. If there are no policies enabled, the list is empty.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The policies enabled for a listener.</p>\"\
    },\
    \"ListenerDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListenerDescription\"}\
    },\
    \"ListenerNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The load balancer does not have a listener configured at the specified port.</p>\",\
      \"error\":{\
        \"code\":\"ListenerNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Listeners\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Listener\"}\
    },\
    \"LoadBalancerAttributeNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified load balancer attribute does not exist.</p>\",\
      \"error\":{\
        \"code\":\"LoadBalancerAttributeNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LoadBalancerAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CrossZoneLoadBalancing\":{\
          \"shape\":\"CrossZoneLoadBalancing\",\
          \"documentation\":\"<p>If enabled, the load balancer routes the request traffic evenly across all instances regardless of the Availability Zones.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html\\\">Configure Cross-Zone Load Balancing</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"AccessLog\":{\
          \"shape\":\"AccessLog\",\
          \"documentation\":\"<p>If enabled, the load balancer captures detailed information of all requests and delivers the information to the Amazon S3 bucket that you specify.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html\\\">Enable Access Logs</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"ConnectionDraining\":{\
          \"shape\":\"ConnectionDraining\",\
          \"documentation\":\"<p>If enabled, the load balancer allows existing requests to complete before the load balancer shifts traffic away from a deregistered or unhealthy instance.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html\\\">Configure Connection Draining</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"ConnectionSettings\":{\
          \"shape\":\"ConnectionSettings\",\
          \"documentation\":\"<p>If enabled, the load balancer allows the connections to remain idle (no data is sent over the connection) for the specified duration.</p> <p>By default, Elastic Load Balancing maintains a 60-second idle connection timeout for both front-end and back-end connections of your load balancer. For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html\\\">Configure Idle Connection Timeout</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"AdditionalAttributes\":{\
          \"shape\":\"AdditionalAttributes\",\
          \"documentation\":\"<p>This parameter is reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The attributes for a load balancer.</p>\"\
    },\
    \"LoadBalancerDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The DNS name of the load balancer.</p>\"\
        },\
        \"CanonicalHostedZoneName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The DNS name of the load balancer.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html\\\">Configure a Custom Domain Name</a> in the <i>Classic Load Balancers Guide</i>.</p>\"\
        },\
        \"CanonicalHostedZoneNameID\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The ID of the Amazon Route 53 hosted zone for the load balancer.</p>\"\
        },\
        \"ListenerDescriptions\":{\
          \"shape\":\"ListenerDescriptions\",\
          \"documentation\":\"<p>The listeners for the load balancer.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The policies defined for the load balancer.</p>\"\
        },\
        \"BackendServerDescriptions\":{\
          \"shape\":\"BackendServerDescriptions\",\
          \"documentation\":\"<p>Information about your EC2 instances.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The Availability Zones for the load balancer.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The IDs of the subnets for the load balancer.</p>\"\
        },\
        \"VPCId\":{\
          \"shape\":\"VPCId\",\
          \"documentation\":\"<p>The ID of the VPC for the load balancer.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The IDs of the instances for the load balancer.</p>\"\
        },\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>Information about the health checks conducted on the load balancer.</p>\"\
        },\
        \"SourceSecurityGroup\":{\
          \"shape\":\"SourceSecurityGroup\",\
          \"documentation\":\"<p>The security group for the load balancer, which you can use as part of your inbound rules for your registered instances. To only allow traffic from load balancers, add a security group rule that specifies this source security group as the inbound source.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The security groups for the load balancer. Valid only for load balancers in a VPC.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"CreatedTime\",\
          \"documentation\":\"<p>The date and time the load balancer was created.</p>\"\
        },\
        \"Scheme\":{\
          \"shape\":\"LoadBalancerScheme\",\
          \"documentation\":\"<p>The type of load balancer. Valid only for load balancers in a VPC.</p> <p>If <code>Scheme</code> is <code>internet-facing</code>, the load balancer has a public DNS name that resolves to a public IP address.</p> <p>If <code>Scheme</code> is <code>internal</code>, the load balancer has a public DNS name that resolves to a private IP address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a load balancer.</p>\"\
    },\
    \"LoadBalancerDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerDescription\"}\
    },\
    \"LoadBalancerNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccessPointName\"}\
    },\
    \"LoadBalancerNamesMax20\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccessPointName\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"LoadBalancerScheme\":{\"type\":\"string\"},\
    \"Marker\":{\"type\":\"string\"},\
    \"Max\":{\"type\":\"string\"},\
    \"ModifyLoadBalancerAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"LoadBalancerAttributes\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"LoadBalancerAttributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>The attributes for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyLoadBalancerAttributes.</p>\"\
    },\
    \"ModifyLoadBalancerAttributesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"LoadBalancerAttributes\":{\
          \"shape\":\"LoadBalancerAttributes\",\
          \"documentation\":\"<p>Information about the load balancer attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifyLoadBalancerAttributes.</p>\"\
    },\
    \"Name\":{\"type\":\"string\"},\
    \"OperationNotPermittedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This operation is not allowed.</p>\",\
      \"error\":{\
        \"code\":\"OperationNotPermitted\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":400,\
      \"min\":1\
    },\
    \"Policies\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppCookieStickinessPolicies\":{\
          \"shape\":\"AppCookieStickinessPolicies\",\
          \"documentation\":\"<p>The stickiness policies created using <a>CreateAppCookieStickinessPolicy</a>.</p>\"\
        },\
        \"LBCookieStickinessPolicies\":{\
          \"shape\":\"LBCookieStickinessPolicies\",\
          \"documentation\":\"<p>The stickiness policies created using <a>CreateLBCookieStickinessPolicy</a>.</p>\"\
        },\
        \"OtherPolicies\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The policies other than the stickiness policies.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The policies for a load balancer.</p>\"\
    },\
    \"PolicyAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeName\":{\
          \"shape\":\"AttributeName\",\
          \"documentation\":\"<p>The name of the attribute.</p>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy attribute.</p>\"\
    },\
    \"PolicyAttributeDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeName\":{\
          \"shape\":\"AttributeName\",\
          \"documentation\":\"<p>The name of the attribute.</p>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy attribute.</p>\"\
    },\
    \"PolicyAttributeDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyAttributeDescription\"}\
    },\
    \"PolicyAttributeTypeDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeName\":{\
          \"shape\":\"AttributeName\",\
          \"documentation\":\"<p>The name of the attribute.</p>\"\
        },\
        \"AttributeType\":{\
          \"shape\":\"AttributeType\",\
          \"documentation\":\"<p>The type of the attribute. For example, <code>Boolean</code> or <code>Integer</code>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the attribute.</p>\"\
        },\
        \"DefaultValue\":{\
          \"shape\":\"DefaultValue\",\
          \"documentation\":\"<p>The default value of the attribute, if applicable.</p>\"\
        },\
        \"Cardinality\":{\
          \"shape\":\"Cardinality\",\
          \"documentation\":\"<p>The cardinality of the attribute.</p> <p>Valid values:</p> <ul> <li> <p>ONE(1) : Single value required</p> </li> <li> <p>ZERO_OR_ONE(0..1) : Up to one value is allowed</p> </li> <li> <p>ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed</p> </li> <li> <p>ONE_OR_MORE(1..*0) : Required. Multiple values are allowed</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy attribute type.</p>\"\
    },\
    \"PolicyAttributeTypeDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyAttributeTypeDescription\"}\
    },\
    \"PolicyAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyAttribute\"}\
    },\
    \"PolicyDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"PolicyTypeName\":{\
          \"shape\":\"PolicyTypeName\",\
          \"documentation\":\"<p>The name of the policy type.</p>\"\
        },\
        \"PolicyAttributeDescriptions\":{\
          \"shape\":\"PolicyAttributeDescriptions\",\
          \"documentation\":\"<p>The policy attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy.</p>\"\
    },\
    \"PolicyDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyDescription\"}\
    },\
    \"PolicyName\":{\"type\":\"string\"},\
    \"PolicyNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyName\"}\
    },\
    \"PolicyNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>One or more of the specified policies do not exist.</p>\",\
      \"error\":{\
        \"code\":\"PolicyNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PolicyTypeDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyTypeName\":{\
          \"shape\":\"PolicyTypeName\",\
          \"documentation\":\"<p>The name of the policy type.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the policy type.</p>\"\
        },\
        \"PolicyAttributeTypeDescriptions\":{\
          \"shape\":\"PolicyAttributeTypeDescriptions\",\
          \"documentation\":\"<p>The description of the policy attributes associated with the policies defined by Elastic Load Balancing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a policy type.</p>\"\
    },\
    \"PolicyTypeDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyTypeDescription\"}\
    },\
    \"PolicyTypeName\":{\"type\":\"string\"},\
    \"PolicyTypeNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyTypeName\"}\
    },\
    \"PolicyTypeNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>One or more of the specified policy types do not exist.</p>\",\
      \"error\":{\
        \"code\":\"PolicyTypeNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Ports\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccessPointPort\"}\
    },\
    \"Protocol\":{\"type\":\"string\"},\
    \"ReasonCode\":{\"type\":\"string\"},\
    \"RegisterEndPointsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"Instances\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The IDs of the instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RegisterInstancesWithLoadBalancer.</p>\"\
    },\
    \"RegisterEndPointsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The updated list of instances for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RegisterInstancesWithLoadBalancer.</p>\"\
    },\
    \"RemoveAvailabilityZonesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"AvailabilityZones\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The Availability Zones.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisableAvailabilityZonesForLoadBalancer.</p>\"\
    },\
    \"RemoveAvailabilityZonesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The remaining Availability Zones for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DisableAvailabilityZonesForLoadBalancer.</p>\"\
    },\
    \"RemoveTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerNames\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The name of the load balancer. You can specify a maximum of one load balancer name.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to remove.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RemoveTags.</p>\"\
    },\
    \"RemoveTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of RemoveTags.</p>\"\
    },\
    \"S3BucketName\":{\"type\":\"string\"},\
    \"SSLCertificateId\":{\"type\":\"string\"},\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupName\":{\"type\":\"string\"},\
    \"SecurityGroupOwnerAlias\":{\"type\":\"string\"},\
    \"SecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"}\
    },\
    \"SetLoadBalancerListenerSSLCertificateInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"LoadBalancerPort\",\
        \"SSLCertificateId\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"LoadBalancerPort\":{\
          \"shape\":\"AccessPointPort\",\
          \"documentation\":\"<p>The port that uses the specified SSL certificate.</p>\"\
        },\
        \"SSLCertificateId\":{\
          \"shape\":\"SSLCertificateId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the SSL certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for SetLoadBalancerListenerSSLCertificate.</p>\"\
    },\
    \"SetLoadBalancerListenerSSLCertificateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of SetLoadBalancerListenerSSLCertificate.</p>\"\
    },\
    \"SetLoadBalancerPoliciesForBackendServerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"InstancePort\",\
        \"PolicyNames\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"InstancePort\":{\
          \"shape\":\"EndPointPort\",\
          \"documentation\":\"<p>The port number associated with the EC2 instance.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The names of the policies. If the list is empty, then all current polices are removed from the EC2 instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for SetLoadBalancerPoliciesForBackendServer.</p>\"\
    },\
    \"SetLoadBalancerPoliciesForBackendServerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of SetLoadBalancerPoliciesForBackendServer.</p>\"\
    },\
    \"SetLoadBalancerPoliciesOfListenerInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadBalancerName\",\
        \"LoadBalancerPort\",\
        \"PolicyNames\"\
      ],\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"LoadBalancerPort\":{\
          \"shape\":\"AccessPointPort\",\
          \"documentation\":\"<p>The external port of the load balancer.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The names of the policies. This list must include all policies to be enabled. If you omit a policy that is currently enabled, it is disabled. If the list is empty, all current policies are disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for SetLoadBalancePoliciesOfListener.</p>\"\
    },\
    \"SetLoadBalancerPoliciesOfListenerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Contains the output of SetLoadBalancePoliciesOfListener.</p>\"\
    },\
    \"SourceSecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerAlias\":{\
          \"shape\":\"SecurityGroupOwnerAlias\",\
          \"documentation\":\"<p>The owner of the security group.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"SecurityGroupName\",\
          \"documentation\":\"<p>The name of the security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a source security group.</p>\"\
    },\
    \"State\":{\"type\":\"string\"},\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>One or more of the specified subnets do not exist.</p>\",\
      \"error\":{\
        \"code\":\"SubnetNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Subnets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key of the tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a tag.</p>\"\
    },\
    \"TagDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"AccessPointName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The tags associated with a load balancer.</p>\"\
    },\
    \"TagDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagDescription\"}\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKeyOnly\"},\
      \"min\":1\
    },\
    \"TagKeyOnly\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The name of the key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The key of a tag.</p>\"\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"min\":1\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TooManyAccessPointsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The quota for the number of load balancers has been reached.</p>\",\
      \"error\":{\
        \"code\":\"TooManyLoadBalancers\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyPoliciesException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The quota for the number of policies for this load balancer has been reached.</p>\",\
      \"error\":{\
        \"code\":\"TooManyPolicies\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The quota for the number of tags that can be assigned to a load balancer has been reached.</p>\",\
      \"error\":{\
        \"code\":\"TooManyTags\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"UnhealthyThreshold\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"UnsupportedProtocolException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified protocol or signature version is not supported.</p>\",\
      \"error\":{\
        \"code\":\"UnsupportedProtocol\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"VPCId\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>Elastic Load Balancing</fullname> <p>A load balancer can distribute incoming traffic across your EC2 instances. This enables you to increase the availability of your application. The load balancer also monitors the health of its registered instances and ensures that it routes traffic only to healthy instances. You configure your load balancer to accept incoming traffic by specifying one or more listeners, which are configured with a protocol and port number for connections from clients to the load balancer and a protocol and port number for connections from the load balancer to the instances.</p> <p>Elastic Load Balancing supports three types of load balancers: Application Load Balancers, Network Load Balancers, and Classic Load Balancers. You can select a load balancer based on your application needs. For more information, see the <a href=\\\"http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/\\\">Elastic Load Balancing User Guide</a>.</p> <p>This reference covers the 2012-06-01 API, which supports Classic Load Balancers. The 2015-12-01 API supports Application Load Balancers and Network Load Balancers.</p> <p>To get started, create a load balancer with one or more listeners using <a>CreateLoadBalancer</a>. Register your instances with the load balancer using <a>RegisterInstancesWithLoadBalancer</a>.</p> <p>All Elastic Load Balancing operations are <i>idempotent</i>, which means that they complete at most one time. If you repeat an operation, it succeeds with a 200 OK response code.</p>\"\
}\
";
}

@end
