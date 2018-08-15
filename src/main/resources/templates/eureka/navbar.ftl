<h1>系统状态</h1>
<div class="row">
  <div class="col-md-6">
    <table id='instances' class="table table-condensed table-striped table-hover">
      <#if amazonInfo??>
        <tr>
          <td>服务注册发现中心</td>
          <td>AMI: ${amiId!}</td>
        </tr>
        <tr>
          <td>区域</td>
          <td>${availabilityZone!}</td>
        </tr>
        <tr>
          <td>实例ID</td>
          <td>${instanceId!}</td>
        </tr>
      </#if>
      <tr>
        <td>环境</td>
        <td>${environment!}</td>
      </tr>
      <tr>
        <td>数据中心</td>
        <td>${datacenter!}</td>
      </tr>
    </table>
  </div>
  <div class="col-md-6">
    <table id='instances' class="table table-condensed table-striped table-hover">
      <tr>
        <td>当前时间</td>
        <td>${currentTime}</td>
      </tr>
      <tr>
        <td>启动时间</td>
        <td>${upTime}</td>
      </tr>
      <tr>
        <td>时间是否到期</td>
        <td>${registry.leaseExpirationEnabled?c}</td>
      </tr>
      <tr>
        <td>更新阈值</td>
        <td>${registry.numOfRenewsPerMinThreshold}</td>
      </tr>
      <tr>
        <td>更新(最近一分钟)</td>
        <td>${registry.numOfRenewsInLastMin}</td>
      </tr>
    </table>
  </div>
</div>

<#if isBelowRenewThresold>
    <#if !registry.selfPreservationModeEnabled>
        <h4 id="uptime"><font size="+1" color="red"><b>阈值小于预期且自我保护模式已关闭。当出现网络异常或其他问题时，可能无法保护您的实例。</b></font></h4>
    <#else>
        <h4 id="uptime"><font size="+1" color="red"><b>紧急！服务注册发现中心可能未正常下线实例。实例阈值小于预期，但为了安全没有下线实例</b></font></h4>
    </#if>
<#elseif !registry.selfPreservationModeEnabled>
    <h4 id="uptime"><font size="+1" color="red"><b>自我保护模式已关闭。当出现网络异常或其他问题时，可能无法保护您的实例。</b></font></h4>
</#if>

<h1>DS 副本</h1>
<ul class="list-group">
  <#list replicas as replica>
    <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
  </#list>
</ul>

