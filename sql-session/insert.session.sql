-- @block
INSERT INTO Artist (ArtistName, ArtistEmail, ArtistPassword, Bio)
VALUES (
        'John Doe',
        'johndoe@email.com',
        'password1',
        'John Doe is a passionate artist known for his vibrant landscapes. With over  10 years of experience, he has honed his skills in various mediums, capturing the essence of nature in his art.'
    ),
    (
        'Jane Smith',
        'janesmith@email.com',
        'password2',
        'Jane Smith is a renowned portrait artist with a unique approach to capturing the soul of her subjects. Her work has been featured in several prestigious galleries and magazines.'
    ),
    (
        'Michael Brown',
        'michaelbrown@email.com',
        'password3',
        'Michael Brown is a versatile artist with a strong background in both digital and traditional mediums. His art often explores themes of identity and societal norms.'
    ),
    (
        'Sarah White',
        'sarahwhite@email.com',
        'password4',
        'Sarah White is a contemporary artist known for her innovative use of materials and light in her installations. Her work has been celebrated for its ability to engage viewers on multiple levels.'
    ),
    (
        'David Green',
        'davidgreen@email.com',
        'password5',
        'David Green is a landscape painter with a distinctive style that combines elements of impressionism and realism. His work is characterized by its rich colors and detailed textures.'
    ),
    (
        'Emily Black',
        'emilyblack@email.com',
        'password6',
        'Emily Black is a digital artist specializing in digital illustrations and graphic design. Her work often explores themes of technology and its impact on society.'
    ),
    (
        'William White',
        'williamwhite@email.com',
        'password7',
        'William White is a conceptual artist known for his thought-provoking installations that often challenge conventional perceptions. His work is a blend of sculpture, performance, and multimedia.'
    ),
    (
        'Patricia Brown',
        'patricia@email.com',
        'password8',
        'Patricia Brown is an abstract painter who creates bold and dynamic compositions. Her work is inspired by the interplay of light and color and aims to evoke emotion in the viewer.'
    ),
    (
        'Robert Green',
        'robertgreen@email.com',
        'password9',
        'Robert Green is a figurative artist with a keen eye for detail. His work often features portraits and still life, capturing the essence of his subjects with a realistic yet stylized approach.'
    ),
    (
        'Linda Black',
        'lindablack@email.com',
        'password10',
        'Linda Black is a mixed-media artist who combines traditional painting techniques with contemporary materials. Her work explores themes of identity and the human condition through a unique visual language.'
    );
-- @block
INSERT INTO Users (UserName, UserEmail, UserPassword)
VALUES (
        'Alex Johnson',
        'alexjohnson@email.com',
        'password11'
    ),
    (
        'Sophia Miller',
        'sophiamiller@email.com',
        'password12'
    ),
    (
        'Liam Williams',
        'liamwilliams@email.com',
        'password13'
    ),
    (
        'Olivia Taylor',
        'oliviatayer@email.com',
        'password14'
    ),
    (
        'Noah Brown',
        'noahbrown@email.com',
        'password15'
    ),
    (
        'Emma White',
        'emmawhite@email.com',
        'password16'
    ),
    (
        'Lucas Jones',
        'lucasjones@email.com',
        'password17'
    ),
    (
        'Ava Martinez',
        'avamartinez@email.com',
        'password18'
    ),
    (
        'Mason Garcia',
        'masongarcia@email.com',
        'password19'
    ),
    (
        'Mia Rodriguez',
        'miarodriguez@email.com',
        'password20'
    );
-- @block
INSERT INTO Commissions (
        Artist_ArtistID,
        User_UserID,
        CommissionDetails,
        CommissionDate,
        Price,
        Deadline
    )
VALUES (
        1,
        1,
        'Portrait commission for a family of four.',
        NOW(),
        500.00,
        '2024-03-01'
    ),
    (
        2,
        2,
        'Landscape painting of a beach scene.',
        NOW(),
        350.00,
        '2024-03-15'
    ),
    (
        3,
        3,
        'Digital illustration of a cityscape.',
        NOW(),
        450.00,
        '2024-04-01'
    ),
    (
        4,
        4,
        'Mixed media piece on the theme of nature.',
        NOW(),
        600.00,
        '2024-04-15'
    ),
    (
        5,
        5,
        'Abstract painting commission.',
        NOW(),
        700.00,
        '2024-05-01'
    ),
    (
        6,
        6,
        'Sculpture commission for a public park.',
        NOW(),
        800.00,
        '2024-05-15'
    ),
    (
        7,
        7,
        'Photography commission for a product launch.',
        NOW(),
        900.00,
        '2024-06-01'
    ),
    (
        8,
        8,
        'Digital painting commission for a video game.',
        NOW(),
        1000.00,
        '2024-06-15'
    ),
    (
        9,
        9,
        'Graphic design for a local business.',
        NOW(),
        1100.00,
        '2024-07-01'
    ),
    (
        10,
        10,
        'Custom furniture design.',
        NOW(),
        1200.00,
        '2024-07-15'
    ),
    (
        1,
        1,
        'Custom artwork for a client.',
        NOW(),
        1300.00,
        '2024-08-01'
    ),
    (
        2,
        2,
        'Mural painting commission for a school.',
        NOW(),
        1400.00,
        '2024-08-15'
    ),
    (
        3,
        3,
        'Fashion illustration for a clothing line.',
        NOW(),
        1500.00,
        '2024-09-01'
    ),
    (
        4,
        4,
        'Comic book illustration for a new series.',
        NOW(),
        1600.00,
        '2024-09-15'
    ),
    (
        5,
        5,
        'Custom jewelry design.',
        NOW(),
        1700.00,
        '2024-10-01'
    ),
    (
        6,
        6,
        'Interior design for a residential project.',
        NOW(),
        1800.00,
        '2024-10-15'
    ),
    (
        7,
        7,
        'Logo design for a new startup.',
        NOW(),
        1900.00,
        '2024-11-01'
    ),
    (
        8,
        8,
        'Custom tattoo design.',
        NOW(),
        2000.00,
        '2024-11-15'
    ),
    (
        9,
        9,
        'Mural painting for a community center.',
        NOW(),
        2100.00,
        '2024-12-01'
    ),
    (
        10,
        10,
        'Digital painting for a video game.',
        NOW(),
        2200.00,
        '2024-12-15'
    );
--@block
INSERT INTO Payments (
        CommisionID,
        PaymentDate,
        PaymentAmount,
        PaymentMethod
    )
VALUES (
        5,
        NOW(),
        700.00,
        'Gopay'
    ),
    (
        11,
        NOW(),
        1300.00,
        'Ovo'
    ),
    (
        17,
        NOW(),
        1900.00,
        'Dana'
    );