/* 
    ACME | Learning Center
    Software Platform
*/

!constant ORGANIZATION_NAME "ACME"
!constant BUSINESS_UNIT "Learning Center"

workspace {

    model {
        group "${ORGANIZATION_NAME} - ${BUSINESS_UNIT}" {
            // Actors/Roles
            student     = person "Student"
            instructor  = person "Instructor"
            visitor     = person "Visitor"

            // Software Platform
            platform = softwareSystem "ACME Learning Center Platform" {
                // Containers
                studentApp      = container "Student App" "Access to student features" "Flutter"
                instructorApp   = container "Instructor App"
                landingPage     = container "Landing Page"
                webApp          = container "Platform Website"
                webAPI          = container "Platform API"
            }

            // Relationships Section

            // Role-to-Platform Relationships
            student     -> platform "Uses"
            instructor  -> platform "Uses"
            visitor     -> platform "Visits"

            // Container-to-Container Relationships
            landingPage     -> webApp
            webApp          -> webAPI
            studentApp      -> webAPI
            instructorApp   -> webAPI

            // Role-to-Container Relationships
            student     -> studentApp       "Uses"
            student     -> webApp           "Uses"
            instructor  -> instructorApp    "Uses"
            instructor  -> webApp           "Uses"
            visitor     -> landingPage      "Visits"

        }
    }

    // Views Specification Section

    views {

        // System Context

        systemContext platform {
            include *
            autoLayout
        }
        // Containers Diagram
        container platform {
            // Roles included
            include visitor instructor student
            // Containers included
            include studentApp instructorApp landingPage webApp webAPI
            autoLayout
        }
        theme default
    }
}
