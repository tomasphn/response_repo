This Ruby on Rails application uses GPT-3 to generate responses to phrases and features a user login system that allows users to comment and react.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

Before getting started, you need to have the following installed on your system:
- Ruby
- Rails
- A GPT-3 API key

### Installation

1. Clone the repository: 

```$ git clone [https://github.com/tomasphn/response_repo.git]```

2. Navigate to the project directory:

	```$ cd response_repo```

3. Install dependencies: 

	```$ bundle install```


4. Set up your GPT-3 API key:

	```$ export GPT3_API_KEY=your_api_key```


5. Create and migrate the database:

	```$ rails db:create $ rails db:migrate```

 6. Start the development server:

	```$ rails server```

 ## Usage

Once the server is started, to use the application, visit `http://localhost:3000` in your web browser. 

## Contributing

If you would like to contribute to this project, please submit a pull request.

## License

This project is licensed under the MIT License.