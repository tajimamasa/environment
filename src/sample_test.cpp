#include <gtest/gtest.h>

bool IsEven(int x)
{
  return x % 2 == 0;
}

TEST(IsEvenTest, Negative)
{
  EXPECT_FALSE(IsEven(-1));
  EXPECT_TRUE(IsEven(-2));
}

TEST(IsEvenTest, Zero)
{
  EXPECT_TRUE(IsEven(0));
}

TEST(IsEvenTest, Positive)
{
  EXPECT_FALSE(IsEven(1));
  EXPECT_TRUE(IsEven(2));
}