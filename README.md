# ASM Mini LibC

A minimal implementation of standard C library functions in x86_64 Assembly. This library provides basic string manipulation, memory operations, and utility functions.

## 🚀 Features

- String manipulation functions
- Memory operations
- Case-insensitive string comparison
- Pattern searching in strings
- Basic bit manipulation

## 📋 Implemented Functions

| Function    | Description |
|-------------|-------------|
| strlen      | Calculate string length |
| strchr      | Find first occurrence of character |
| strrchr     | Find last occurrence of character |
| strcmp      | Compare two strings |
| strncmp     | Compare n characters of two strings |
| strcasecmp  | Compare strings ignoring case |
| strstr      | Find substring in string |
| strpbrk     | Search string for any character from set |
| strcspn     | Get length of complementary substring |
| memset      | Fill memory with constant byte |
| memcpy      | Copy memory area |
| memmove     | Copy memory area with overlap handling |
| memfrob     | Frobnicate (encrypt) memory area |
| ffs         | Find first bit set |

## 🛠️ Building the Project

```sh
# Build the shared library
make

# Clean object files
make clean

# Full clean (including library)
make fclean

# Rebuild
make re

# Build and run tests
make exec
```

## 🚦 Usage

Link your program with the library:
```sh
gcc -o your_program your_source.c -L. -lasm
```

Run your program with the library:
```sh
LD_LIBRARY_PATH=. ./your_program
```

## 📝 Example

The project includes a test suite (main.c) that demonstrates the usage of all implemented functions.

## ⚠️ Note

This is an educational project implementing basic C library functions in Assembly. Not intended for production use.
