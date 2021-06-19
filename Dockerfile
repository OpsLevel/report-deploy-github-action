FROM public.ecr.aws/opslevel/cli:v0.0.1-beta.2
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
