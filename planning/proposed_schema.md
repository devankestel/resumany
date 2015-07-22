Proposed Schema

  Models and Relations 

    Resume
      has_many experiences
      has_many demonstrations through experiences
      has_many links

    Link
      belongs_to resume

    Experience
      belongs_to resume
      has_many demonstrations

    Demonstration
      belongs_to experience

  Schema (* = optional parameter or piece of parameter)

    Resume

      resume_name:string (name for resume route and downloadable files) (AS INDEX?!)
      name:string (name of applicant)
      email:string (e-mail of applicant)
      phone:string (phone number of applicant)
      profile:string (paragraph describing applicant's personal traits and job objective*)
      pdf:attachment (pdf file attachment of resume)
      txt:attachment (txt file attachment of resume)
      docx:attachment (docx file attachment of resume)

    Link

      url:string (url of social media, portfolio, or website link)
      title:string (text that will be associated with link. ex: "My Portfolio", "Github", "Twitter")

    Experience

      title:string (job title, student major, or similar)
      description:string (additional text describing position*)
      organization:string (school, volunteer org, business, etc.)
      start_date:datetime (month*, day*, year experience started)
      end_date:datetime (month*, day*, year experience ended)
      type:string (education, volunteer, paid, skills, or other applicant specified category)
      city:string (city where organization is based)
      state:string (state where organization is based)
      present:boolean (true if experience is current)

    Demonstration

      description:string (bullet point text)
      core:boolean (true if demonstration should ALWAYS be included in generated subset resumes)
      type:string (skill, accomplishment, or milestone (actual form input might be radio button))
      tags:taggable (user generated tags categorizing demonstration, ex: "project management", "leadership", "computer science", etc.)
      level:string (null unless of type skill, otherwise user described, ex: "novice", "proficient", "expert", etc.)
      cert:string (null unless of type milestone, otherwise user described certification body, ex: "Cicerone Program", "RABSQA", "The Iron Yard", etc.)



