class AllQuote {
  static List<Map<String, dynamic>> allquotes = [
    {
      "author": "Albert Einstein",
      "quote": "Imagination is more important than knowledge.",
    },
    {
      "author": "Maya Angelou",
      "quote":
          "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel."
    },
    {
      "author": "Mark Twain",
      "quote": "The secret of getting ahead is getting started."
    },
    {
      "author": "Walt Disney",
      "quote": "The way to get started is to quit talking and begin doing."
    },
    {
      "author": "Oscar Wilde",
      "quote": "Be yourself; everyone else is already taken."
    },
    {
      "author": "Steve Jobs",
      "quote":
          "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do."
    },
    {
      "author": "Nelson Mandela",
      "quote":
          "The greatest glory in living lies not in never falling, but in rising every time we fall."
    },
    {
      "author": "Confucius",
      "quote":
          "Our greatest glory is not in never falling, but in rising every time we fall."
    },
    {
      "author": "Ralph Waldo Emerson",
      "quote":
          "Do not go where the path may lead, go instead where there is no path and leave a trail."
    },
    {
      "author": "William Shakespeare",
      "quote":
          "To thine own self be true, and it must follow, as the night the day, thou canst not then be false to any man."
    },
    {
      "author": "Eleanor Roosevelt",
      "quote": "No one can make you feel inferior without your consent."
    },
    {
      "author": "Vincent Van Gogh",
      "quote": "I would rather die of passion than of boredom."
    },
    {
      "author": "Mahatma Gandhi",
      "quote":
          "The best way to find yourself is to lose yourself in the service of others."
    },
    {
      "author": "Martin Luther King Jr.",
      "quote": "The time is always right to do what is right."
    },
    {
      "author": "Helen Keller",
      "quote":
          "The only thing worse than being blind is having sight but no vision."
    },
    {
      "author": "Mother Teresa",
      "quote":
          "Not all of us can do great things. But we can do small things with great love."
    },
    {
      "author": "Bruce Lee",
      "quote":
          "The successful warrior is the average man, with laser-like focus."
    },
    {
      "author": "J.K. Rowling",
      "quote":
          "It is our choices that show what we truly are, far more than our abilities."
    },
    {"author": "Abraham Lincoln", "quote": "Whatever you are, be a good one."},
    {
      "author": "Rumi",
      "quote": "The wound is the place where the Light enters you."
    },
    {
      "author": "Coco Chanel",
      "quote": "The most courageous act is still to think for yourself. Aloud."
    },
    {
      "author": "Buddha",
      "quote": "The mind is everything. What you think you become."
    },
    {
      "author": "Friedrich Nietzsche",
      "quote": "That which does not kill us makes us stronger."
    },
    {
      "author": "John Lennon",
      "quote": "Life is what happens when you're busy making other plans."
    },
    {"author": "Heraclitus", "quote": "The only constant in life is change."},
    {
      "author": "Anne Frank",
      "quote":
          "How wonderful it is that nobody need wait a single moment before starting to improve the world."
    },
    {
      "author": "Leo Tolstoy",
      "quote":
          "Everyone thinks of changing the world, but no one thinks of changing himself."
    },
    {"author": "Socrates", "quote": "An unexamined life is not worth living."},
    {
      "author": "Bruce Barton",
      "quote": "When you're through changing, you're through."
    },
    {
      "author": "George Bernard Shaw",
      "quote":
          "Life isn't about finding yourself. Life is about creating yourself."
    }
  ];
}

class Quote {
  String quote;
  String author;

  Quote({
    required this.quote,
    required this.author,
  });

  factory Quote.fromMap({required Map<String, dynamic> data}) {
    return Quote(quote: data['quote'], author: data['author']);
  }
}
