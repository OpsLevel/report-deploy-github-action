FROM public.ecr.aws/opslevel/cli:v0.1.0-beta.1
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
