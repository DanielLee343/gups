#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long u64Int; // Assuming u64Int is defined this way

int main()
{
    unsigned int nlocal = 2147483648; // Example large value for demonstration
    printf("Attempting to allocate table with size: %u elements\n", nlocal);
    printf("sizeof(u64Int) size: %zu bytes\n", sizeof(u64Int));

    size_t table_size = (size_t)nlocal * sizeof(u64Int); // Use size_t for table_size
    printf("table_size: %zu bytes\n", table_size);

    u64Int *table = (u64Int *)malloc(table_size);
    if (table == NULL)
    {
        perror("Table allocation failed");
        return 1;
    }

    // Free memory if allocation succeeds
    free(table);
    return 0;
}