def is_palindrome(s):
    s = ''.join(c for c in s if c.isalnum()).lower()  # remove non-alphanumeric characters and convert to lowercase
    return s == s[::-1]  # compare the string with its reverse