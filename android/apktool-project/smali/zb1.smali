.class public final Lzb1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Las0;


# virtual methods
.method public final a(Landroid/view/View;Lzp;)Lzp;
    .locals 8

    .line 1
    const-string p0, "ReceiveContent"

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p2, Lzp;->a:Lyp;

    .line 14
    .line 15
    invoke-interface {p0}, Lyp;->h()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x2

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    return-object p2

    .line 23
    :cond_1
    invoke-interface {p0}, Lyp;->a()Landroid/content/ClipData;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p0}, Lyp;->getFlags()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    check-cast p1, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/text/Editable;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v1, 0x0

    .line 44
    move v2, v1

    .line 45
    move v3, v2

    .line 46
    :goto_0
    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-ge v2, v4, :cond_6

    .line 51
    .line 52
    invoke-virtual {p2, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const/4 v5, 0x1

    .line 57
    and-int/lit8 v6, p0, 0x1

    .line 58
    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    invoke-virtual {v4, p1}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    instance-of v6, v4, Landroid/text/Spanned;

    .line 66
    .line 67
    if-eqz v6, :cond_3

    .line 68
    .line 69
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {v4, p1}, Landroid/content/ClipData$Item;->coerceToStyledText(Landroid/content/Context;)Ljava/lang/CharSequence;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    :cond_3
    :goto_1
    if-eqz v4, :cond_5

    .line 79
    .line 80
    if-nez v3, :cond_4

    .line 81
    .line 82
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    invoke-static {v0, v3}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v0, v7, v3, v4}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 110
    .line 111
    .line 112
    move v3, v5

    .line 113
    goto :goto_2

    .line 114
    :cond_4
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    const-string v6, "\n"

    .line 119
    .line 120
    invoke-interface {v0, v5, v6}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 121
    .line 122
    .line 123
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-interface {v0, v5, v4}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 128
    .line 129
    .line 130
    :cond_5
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_6
    const/4 p0, 0x0

    .line 134
    return-object p0
.end method
