df_merge = pd.merge(
    df_wiki,
    df_db_small,
    left_on="itemLabel",
    right_on="label",
    how="left"
)

df_final = df_merge[df_merge["affiliation"].notna()]
