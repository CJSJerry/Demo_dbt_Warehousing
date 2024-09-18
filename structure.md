. \
│ \
├── docker-compose.yml \
│ \
├── data/ \
│   ├── init.sql \
│   └── servers.json \
│ \
├── warehouse/ \
│   ├── .gitignore \
│   ├── .env \
│   ├── run_dbt.py \
│   ├── dbt_project.yml \
│   ├── profiles.yml \
│   ├── models/ \
│   │   └── example/ \
│   │       ├── schema.yml \
│   │       ├── src_demo_inc.yml \
│   │       └── (dim_ and fact_ tables).sql \
│   ├── tests/ \
│   │   │── accuracy \
│   │   │   └── (tests).sql \
│   │   │── completeness \
│   │   │   └── (tests).sql \
│   │   │── consistency \
│   │   │   └── (tests).sql \
│   │   └── uniqueness \
│   │       └── (tests).sql \
│   └── example_queries.py \
│ \
├── requirements.txt \
│ \
├── .gitignore \
│ \
├── structure.md \
│ \
└── README.md