
using Nest;


namespace Repository.SearchAutoNest
{
    public class ElasticsearchService
    {

        private readonly IElasticClient _client;

        public ElasticsearchService(IElasticClient client)
        {
            _client = client;
        }

        // Method to create an index
        public async Task CreateProductIndexAsync()
        {
            var createIndexResponse = await _client.Indices.CreateAsync("products", c => c
                .Map<Product>(m => m
                    .AutoMap() // Automatically map fields
                    .Properties(ps => ps
                        .Text(t => t
                            .Name(n => n.ProductName)
                            .Analyzer("vi") // Use Vietnamese analyzer for this field
                        )
                    )
                )
            );
        }

        // Method to index a product
        public async Task IndexProductAsync(Product product)
        {
            await _client.IndexDocumentAsync(product); // Index a single document
        }

        public async Task<List<string>> SearchProductsAsync(string searchTerm)
        {
            var searchResponse = await _client.SearchAsync<Product>(s => s
                .Query(q => q
                    .Match(m => m
                        .Field(f => f.ProductName)
                        .Query(searchTerm)
                    )
                )
            );

            var productNames = new List<string>();
            foreach (var hit in searchResponse.Hits)
            {
                productNames.Add(hit.Source.ProductName);
            }

            return productNames;
        }
    }
}
