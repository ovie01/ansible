To test elasticsearch do on commandline
curl -X GET 'http://localhost:9200'

KEY CONFIG TO CHANGE
node.name  >> Uncomment and change value to what you want

cluster.name  >> used by the auto-discovery feature of Elasticsearch to automatically discover and associate Elasticsearch nodes to a cluster.

node.master  >> The setting which determines the role of the server is called node.master. If you have only one Elasticsearch node, you should leave this option commented out so that it keeps its default value of true — i.e. the sole node should be also a master. Alternatively, if you wish to configure the node as a slave, remove the # character at the beginning of the node.master line, and change the value to false:

node.data:  >> determines whether a node will store data or not. In most cases this option should be left to its default value (true)

index.number_of_shards:  >> determines into how many pieces (shards) the index will be split into.

index.number_of_replicas: >>> defines the number of replicas which will be distributed across the cluster. Having more shards improves the indexing performance, while having more replicas makes searching faster.

path.data: >>path for data to be stored


LOG FILES
/var/log/elasticsearch/
