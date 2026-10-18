.class public final synthetic Lwt1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ldu1;


# direct methods
.method public synthetic constructor <init>(Ldu1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lwt1;->j:Ldu1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object p0, p0, Lwt1;->j:Ldu1;

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/content/ContentValues;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "elapsed_time"

    .line 13
    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "raw_events"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {v0, v2, v1, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception v0

    .line 31
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Ly02;

    .line 34
    .line 35
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 36
    .line 37
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 41
    .line 42
    const-string v1, "Failed to remove elapsed times from raw events table"

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
