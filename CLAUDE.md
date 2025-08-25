# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Ruby on Rails 8 web application called "GeneTestOrNot" - a decision support tool that helps users evaluate whether to undergo genetic testing for Alzheimer's disease risk. The application presents a series of questions through an interactive questionnaire format with video testimonials from real people (performed by actors).

## Technology Stack

- **Framework**: Ruby on Rails 8
- **Database**: PostgreSQL (with pg gem)
- **Frontend**: SCSS/Sass, JavaScript, jQuery, jQuery UI
- **CSS Framework**: Susy grid system with normalize-rails
- **Icons**: Font Awesome
- **Video**: Wistia integration for testimonial videos
- **Production**: Includes rails_12factor for Heroku deployment

## Database Schema

Two main models:
- **Question**: Stores question text and up to 4 response options (`body`, `response_01-04`)
- **AnswerList**: Tracks user responses across 4 question categories (`family_risks`, `useful`, `pros_and_cons`, `timing`)

## Application Architecture

### Controllers
- **HomeController**: Handles static informational pages (about, disclaimer, privacy, etc.)
- **QuestionsController**: Handles the 4-step questionnaire flow

### Key Routes
The application uses a question-based flow:
1. `/family_risks` - Family risk assessment
2. `/is_the_information_useful` - Information utility evaluation
3. `/is_the_timing_right` - Timing considerations
4. `/pros_and_cons` - Advantages vs disadvantages with video testimonials
5. `/results` - Final recommendations

### Frontend Structure
- **Assets**: Located in `app/assets/` with organized SCSS partials in `new/` subdirectory
- **Views**: ERB templates with question-specific layouts and shared footer/header
- **JavaScript**: Javascript files for page-specific interactions and Google Analytics
- **Styling**: SCSS with mixins for charts, questions, and responsive design

## Development Commands

### Basic Rails Commands
```bash
# Install dependencies
bundle install

# Database setup
rake db:create
rake db:migrate
rake db:seed

# Start development server
rails server

# Run Rails console
rails console

# Run database migrations
rake db:migrate

# Reset database
rake db:drop db:create db:migrate db:seed
```

### Asset Management
```bash
# Precompile assets (for production)
rake assets:precompile

# Clean compiled assets
rake assets:clean
```

### Development Tools
- **Debugging**: Uses `pry-rails` for enhanced console debugging
- **Development Console**: Access via `<%= console %>` in views or `byebug` in code

## Key Features

1. **Multi-step Questionnaire**: 4-question flow with progress tracking
2. **Video Testimonials**: Integrated Wistia videos with pros/cons perspectives
3. **Local Storage**: JavaScript persistence of user answers across sessions
4. **Responsive Design**: Mobile-friendly layout with Susy grid system
5. **Modal Interactions**: Warning modals for incomplete questions

## File Structure Notes

- Question-specific assets and views are organized by question type
- SCSS partials follow BEM-like naming with mixins for reusable components
- JavaScript files provide page-specific interactivity
- Static assets include professional headshots and branding materials
- Database migrations show the evolution from basic Question model to AnswerList tracking

## Production Deployment

Asset pipeline is configured for production use with precompiled assets in `public/assets/`.