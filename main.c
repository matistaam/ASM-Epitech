/*
** EPITECH PROJECT, 2025
** B-ASM-400-LYN-4-1-asmminilibc-matis.taam
** File description:
** main
*/

#include <stdio.h>

int ffs(int i);
void *memfrob(void *s, size_t len);
void *memmove(void *dest, const void *src, size_t n);
void *memcpy(void *dest, const void *src, size_t n);
void *memset(void *s, int c, size_t n);
size_t strcspn(const char *s, const char *reject);
char *strpbrk(const char *s, const char *accept);
char *strstr(const char *haystack, const char *needle);
int strcasecmp(const char *s1, const char *s2);
int strncmp(const char *s1, const char *s2, size_t n);
int strcmp(const char *s1, const char *s2);
char *strrchr(const char *s, int c);
char *strchr(const char *s, int c);
size_t strlen(const char *s);

void test_ffs(void)
{
    printf("Testing ffs:\n");
    printf("  ffs(0): %d\n", ffs(0));
    printf("  ffs(1): %d\n", ffs(1));
    printf("  ffs(2): %d\n", ffs(2));
    printf("  ffs(3): %d\n", ffs(3));
    printf("  ffs(4): %d\n", ffs(4));
    printf("  ffs(128): %d\n", ffs(128));
    printf("\n");
}

void test_memfrob(void)
{
    char str[] = "Hello World!";

    printf("Testing memfrob:\n");
    printf("  Original: %s\n", str);
    memfrob(str, strlen(str));
    printf("  Encrypted: %s\n", str);
    memfrob(str, strlen(str));
    printf("  Decrypted: %s\n", str);
    printf("\n");
}

void test_memmove(void)
{
    char str[] = "Hello World!";
    char str2[] = "Hello World!";

    printf("Testing memmove:\n");
    memmove(str + 6, str, 5);
    printf("  Move forward (overlap): %s\n", str);
    memmove(str2, str2 + 6, 6);
    printf("  Move backward (overlap): %s\n", str2);
    printf("\n");
}

void test_memcpy(void)
{
    const char src[] = "Hello World!";
    char dest[20];
    char dest2[20] = "AAAAA";

    printf("Testing memcpy:\n");
    memcpy(dest, src, strlen(src) + 1);
    printf("  Full copy: %s\n", dest);
    memcpy(dest2, src, 5);
    dest2[5] = '\0';
    printf("  Partial copy (5 chars): %s\n", dest2);
    printf("\n");
}

void test_memset(void)
{
    char buffer[20];

    printf("Testing memset:\n");
    memset(buffer, 'A', 10);
    buffer[10] = '\0';
    printf("  Fill with 'A': %s\n", buffer);
    memset(buffer, 0, 10);
    printf("  Fill with nulls: %s\n", buffer);
    memset(buffer, '1', 5);
    buffer[5] = '\0';
    printf("  Fill with '1': %s\n", buffer);
    printf("\n");
}

void test_strcspn(void)
{
    const char *str = "Hello World!";

    printf("Testing strcspn:\n");
    printf("  Length until 'aeiou' in '%s': %zu\n", str, strcspn(str, "aeiou"));
    printf("  Length until 'xyz' in '%s': %zu\n", str, strcspn(str, "xyz"));
    printf("  Length until 'Wld' in '%s': %zu\n", str, strcspn(str, "Wld"));
    printf("\n");
}

void test_strpbrk(void)
{
    const char *str = "Hello World!";

    printf("Testing strpbrk:\n");
    printf("  First of 'aeiou' in '%s': %s\n", str, strpbrk(str, "aeiou"));
    printf("  First of 'xyz' in '%s': %s\n", str, strpbrk(str, "xyz"));
    printf("  First of 'Wld' in '%s': %s\n", str, strpbrk(str, "Wld"));
    printf("\n");
}

void test_strstr(void)
{
    const char *haystack = "Hello World!";

    printf("Testing strstr:\n");
    printf("  Find 'World' in '%s': %s\n", haystack, strstr(haystack, "World"));
    printf("  Find 'lo' in '%s': %s\n", haystack, strstr(haystack, "lo"));
    printf("  Find 'xyz' in '%s': %s\n", haystack, strstr(haystack, "xyz"));
    printf("  Find '' in '%s': %s\n", haystack, strstr(haystack, ""));
    printf("\n");
}

void test_strcasecmp(void)
{
    printf("Testing strcasecmp:\n");
    printf("  'Hello' vs 'hello': %d\n", strcasecmp("Hello", "hello"));
    printf("  'WORLD' vs 'world': %d\n", strcasecmp("WORLD", "world"));
    printf("  'Hello' vs 'HELP': %d\n", strcasecmp("Hello", "HELP"));
    printf("  'hello' vs 'world': %d\n", strcasecmp("hello", "world"));
    printf("\n");
}

void test_strncmp(void)
{
    printf("Testing strncmp:\n");
    printf("  'hello' vs 'help' (4 chars): %d\n", strncmp("hello", "help", 4));
    printf("  'hello' vs 'hello world' (5 chars): %d\n", strncmp("hello", "hello world", 5));
    printf("  'hello' vs 'help' (3 chars): %d\n", strncmp("hello", "help", 3));
    printf("  '' vs '' (0 chars): %d\n", strncmp("", "", 0));
    printf("\n");
}

void test_strcmp(void)
{
    printf("Testing strcmp:\n");
    printf("  'hello' vs 'hello': %d\n", strcmp("hello", "hello"));
    printf("  'hello' vs 'world': %d\n", strcmp("hello", "world"));
    printf("  'world' vs 'hello': %d\n", strcmp("world", "hello"));
    printf("  '' vs '': %d\n", strcmp("", ""));
    printf("\n");
}

void test_strrchr(void)
{
    const char *test_str = "Hello World!";
    char search_chars[] = {'o', 'l', '!', 'x'};
    char *found = NULL;

    printf("Testing strrchr:\n");
    for (size_t i = 0; i < sizeof(search_chars); i++) {
        found = strrchr(test_str, search_chars[i]);
        if (found)
            printf("  Last '%c' found at position %ld\n", search_chars[i], found - test_str);
        else
            printf("  '%c' not found\n", search_chars[i]);
    }
    printf("\n");
}

void test_strchr(void)
{
    const char *test_str = "Hello World!";
    char search_chars[] = {'W', 'o', '!', 'x'};
    char *found = NULL;

    printf("Testing strchr:\n");
    for (size_t i = 0; i < sizeof(search_chars); i++) {
        found = strchr(test_str, search_chars[i]);
        if (found)
            printf("  '%c' found at position %ld\n", search_chars[i], found - test_str);
        else
            printf("  '%c' not found\n", search_chars[i]);
    }
    printf("\n");
}

void test_strlen(void)
{
    const char *test_cases[] = {
        "Hello World!",
        "",
        "Test",
        "1234567890"
    };
    size_t result = 0;

    printf("Testing strlen:\n");
    for (size_t i = 0; i < sizeof(test_cases) / sizeof(test_cases[0]); i++) {
        result = strlen(test_cases[i]);
        printf("  \"%s\" -> length: %zu\n", test_cases[i], result);
    }
    printf("\n");
}

int main(void)
{
    printf("=== ASM Mini LibC Test Suite ===\n\n");
    test_strlen();
    test_strchr();
    test_strrchr();
    test_strcmp();
    test_strncmp();
    test_strcasecmp();
    test_strstr();
    test_strpbrk();
    test_strcspn();
    test_memset();
    test_memcpy();
    test_memmove();
    test_memfrob();
    test_ffs();
    printf("\n=== All tests completed ===\n");
    return (0);
}
