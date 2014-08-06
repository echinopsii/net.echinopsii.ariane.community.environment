<?xml version="1.0" encoding="UTF-8"?>
<infinispan
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="urn:infinispan:config:6.0 http://www.infinispan.org/schemas/infinispan-config-6.0.xsd"
        xmlns="urn:infinispan:config:6.0">

   <global>
      <globalJmxStatistics enabled="true" cacheManagerName="ARIANE_CORE_INJECTOR_COMPONENTS_CACHE_MGR"/>
   </global>

    <namedCache name="ariane.community.core.injector.shared.components.cache">
        <persistence passivation="false">
            <singleFile fetchPersistentState="true"
                        ignoreModifications="false"
                        purgeOnStartup="false" 
			location="%%VIRGO_HOME/ariane/cache/core/injector"/>
        </persistence>
    </namedCache>

</infinispan>
